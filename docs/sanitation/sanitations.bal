// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
import ballerina/io;
import ballerina/lang.regexp;

type Items record {
    string 'type?;
    string[] 'enum?;
    string \$ref?;
};

type Schema record {
    string 'type?;
    boolean uniqueItems?;
    Items items?;
    string title?;
    json properties?;
};

type ParametersItem record {
    string name?;
    string 'in?;
    boolean required?;
    string description?;
    boolean explode?;
    Schema schema?;
    string \$ref?;
};

type EnumItems record {
    string 'type;
    string[] 'enum;
};

type EnumSchema record {
    string 'type;
    boolean uniqueItems;
    EnumItems items;
};

type Get record {
    string operationId?;
    string summary?;
    string description?;
    string[] tags?;
    ParametersItem[] parameters?;
    json responses?;
};

type Post record {
    string operationId?;
    string summary?;
    string description?;
    string[] tags?;
    json requestBody?;
    ParametersItem[] parameters?;
    json responses?;
};

type Parameter record {
    string name?;
    string 'in?;
    boolean required?;
    string description?;
    boolean explode?;
    json schema?;
};

type Path record {
    Parameter[] parameters?;
    Get get?;
    Post post?;
};

type ResponseCode record {
    string description?;
    json content?;
};

type ResponseHeader record {
    json schema?;
};

type Specification record {
    string swagger?;
    string openapi?;
    json info;
    json externalDocs?;
    string x\-sap\-api\-type?;
    string x\-sap\-shortText?;
    string x\-sap\-software\-min\-version?;
    json[] x\-sap\-ext\-overview?;
    json[] servers?;
    json x\-sap\-extensible?;
    json[] tags?;
    string[] schemes?;
    string host?;
    string basePath?;
    string[] consumes?;
    string[] produces?;
    json x\-servers?;
    json securityDefinitions?;
    map<Path> paths;
    // Swagger 2.0 top-level definitions
    map<json> definitions?;
    // Swagger 2.0 top-level parameters
    map<json> parameters?;
    json responses?;
    json[] security?;
};

public function main(string apiName) returns error? {
    string specPath = string `spec/${apiName}.json`;
    check sanitizeSchemaNames(apiName, specPath);
    check sanitizeResponseSchemaNames(specPath);
}

function sanitizeSchemaNames(string apiName, string specPath) returns error? {
    json openAPISpec = check io:fileReadJson(specPath);
    Specification spec = check openAPISpec.cloneWithType(Specification);

    map<json> definitions = spec.definitions ?: {};
    map<json> updatedDefinitions = {};
    map<string> updatedNames = {};

    foreach [string, json] [schemaName, schema] in definitions.entries() {
        boolean schemaNameCheck = schemaName.includes(".");
        if schemaNameCheck {
            string updatedKey = getSanitizedSchemaName(schemaName);
            updatedDefinitions[updatedKey] = schema;
            updatedNames[schemaName] = updatedKey;
        } else {
            updatedDefinitions[schemaName] = schema;
        }
    }
    spec.definitions = updatedDefinitions;

    string updatedSpec = spec.toJsonString();
    foreach [string, string] [oldName, newName] in updatedNames.entries() {
        string sanitizedOldNameRegex = re `\.`.replace(oldName, "\\.");
        regexp:RegExp regexpPattern = re `${sanitizedOldNameRegex}"`;
        updatedSpec = regexpPattern.replaceAll(updatedSpec, newName + "\"");
    }

    check io:fileWriteString(specPath, updatedSpec);
}

function getSanitizedSchemaName(string schemaName) returns string {
    int? indexOfPeriod = schemaName.lastIndexOf(".");
    int substringStartIndex = indexOfPeriod == () ? 0 : indexOfPeriod + 1;
    string updatedKey = schemaName.substring(substringStartIndex);

    if updatedKey.endsWith("_Type") {
        updatedKey = updatedKey.substring(0, updatedKey.length() - 5);
    }

    if updatedKey.endsWith("_Type-create") {
        updatedKey = "Create" + updatedKey.substring(0, updatedKey.length() - 12);
    }

    if updatedKey.endsWith("_Type-update") {
        updatedKey = "Update" + updatedKey.substring(0, updatedKey.length() - 12);
    }

    if updatedKey.endsWith("Type") {
        updatedKey = updatedKey.substring(0, updatedKey.length() - 4);
    }

    if updatedKey.endsWith("-create") {
        updatedKey = "Create" + updatedKey.substring(0, updatedKey.length() - 7);
    }

    if updatedKey.endsWith("-update") {
        updatedKey = "Update" + updatedKey.substring(0, updatedKey.length() - 7);
    }
    return updatedKey;
}

function sanitizeResponseSchemaNames(string specPath) returns error? {
    json openAPISpec = check io:fileReadJson(specPath);
    Specification spec = check openAPISpec.cloneWithType(Specification);

    map<Path> paths = spec.paths;
    foreach var [_, value] in paths.entries() {
        if value.get != () {
            Get getPath = value.get ?: {};
            json? responses = getPath.responses;
            if responses is () {
                continue;
            }
            json|error r200 = responses.'200;
            json response200 = r200 is json ? r200 : {};
            json|error descField = response200.description;
            string desc = descField is string ? descField : "";
            if desc == "Retrieved entities" {
                // Swagger 2.0 inline schema - update title via properties
                json|error schemaField = response200.schema;
                json schema = schemaField is json ? schemaField : {};
                json|error propsField = schema.properties;
                json props = propsField is json ? propsField : {};
                json|error dField = props.d;
                json dProp = dField is json ? dField : {};
                json|error titleField = dProp.title;
                string title = (titleField is string ? titleField : "").trim();
                if title.startsWith("Collection of") {
                    title = "CollectionOf" + title.substring(14);
                }
                if title.endsWith("Type") {
                    title = title.substring(0, title.length() - 4);
                }
            }
        }
    }

    check io:fileWriteJson(specPath, spec.toJson());
}
