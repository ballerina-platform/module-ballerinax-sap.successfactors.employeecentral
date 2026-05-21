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

import ballerina/log;
import ballerinax/googleapis.sheets;
import ballerinax/sap.successfactors.ecpersonalinformation as personalinfo;

configurable SheetsClientConfig sheetsClientConfig = ?;
configurable SFClientConfig sfClientConfig = ?;
configurable string spreadsheetId = ?;
configurable string sheetName = "Employees";

final sheets:Client sheetsClient = check new ({
    auth: {
        clientId: sheetsClientConfig.clientId,
        clientSecret: sheetsClientConfig.clientSecret,
        refreshToken: sheetsClientConfig.refreshToken,
        refreshUrl: sheetsClientConfig.refreshUrl
    }
});

final personalinfo:Client sfClient = check new (
    config = {
        auth: {
            username: sfClientConfig.username,
            password: sfClientConfig.password
        }
    },
    hostname = sfClientConfig.hostname
);

const int HEADER_ROW = 1;

public function main() returns error? {
    sheets:Range range = check sheetsClient->getRange(spreadsheetId, sheetName, "A1:A100");
    (int|string|decimal)[][] rows = range.values;

    if rows.length() <= HEADER_ROW {
        log:printInfo("No employee IDs found in the sheet.");
        return;
    }

    int found = 0;
    int notFound = 0;

    foreach int i in HEADER_ROW ..< rows.length() {
        if rows[i].length() == 0 {
            continue;
        }
        string personId = rows[i][0].toString().trim();
        if personId == "" {
            continue;
        }

        personalinfo:Wrapper_3|error result = sfClient->listPerPersonals(
            queries = {
                \$filter: string `personIdExternal eq '${personId}'`,
                \$top: 1
            }
        );

        if result is error {
            log:printError(string `Failed to fetch record for ${personId}: ${result.message()}`);
            notFound += 1;
            continue;
        }

        personalinfo:PerPersonal[] employees = result.d?.results ?: [];
        if employees.length() == 0 {
            log:printWarn(string `No personal information found for employee: ${personId}`);
            notFound += 1;
        } else {
            personalinfo:PerPersonal emp = employees[0];
            string firstName = (emp["firstName"] ?: "").toString();
            string lastName = (emp["lastName"] ?: "").toString();
            string gender = (emp["gender"] ?: "").toString();
            log:printInfo(string `Employee ${personId}: ${firstName} ${lastName} (${gender})`);
            found += 1;
        }
    }

    log:printInfo(string `Lookup complete. Found: ${found}, Not found: ${notFound}`);
}
