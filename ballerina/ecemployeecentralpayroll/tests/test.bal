// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/os;
import ballerina/test;

configurable boolean isTestOnLiveServer = os:getEnv("IS_TEST_ON_SUCCESSFACTORS_SERVER") == "true";

Client sfClient = test:mock(Client);

@test:BeforeSuite
function initializeClientsForServer() returns error? {
    if isTestOnLiveServer {
        sfClient = check new (
            config = {
                auth: {
                    username: os:getEnv("SF_USERNAME"),
                    password: os:getEnv("SF_PASSWORD")
                }
            },
            hostname = os:getEnv("SF_HOSTNAME")
        );
    }
}

@test:Config
function testEmployeePayrollRunResultsItems() returns error? {
    if !isTestOnLiveServer {
        test:assertTrue(true, "Skipping live server test");
        return;
    }
    var result = sfClient->listEmployeePayrollRunResultsItemss();
    test:assertTrue(result !is error, "Expected successful response");
}
