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

import ballerina/http;
import ballerina/log;
import ballerina/time;
import ballerinax/sap.successfactors.ecemploymentinformation as empinfo;

configurable SFClientConfig sfClientConfig = ?;
configurable string slackWebhookUrl = ?;
configurable string lookbackDays = "7";

final empinfo:Client sfClient = check new (
    config = {
        auth: {
            username: sfClientConfig.username,
            password: sfClientConfig.password
        }
    },
    hostname = sfClientConfig.hostname
);

final http:Client slackClient = check new (slackWebhookUrl);

public function main() returns error? {
    time:Civil since = time:utcToCivil(time:utcAddSeconds(time:utcNow(), -(<decimal>lookbackDays * 86400)));
    string sinceDate = string `${since.year}-${since.month < 10 ? "0" : ""}${since.month}-${since.day < 10 ? "0" : ""}${since.day}`;

    log:printInfo(string `Fetching new hires since ${sinceDate}...`);

    empinfo:Wrapper_1 response = check sfClient->listEmpEmployments(
        queries = {
            \$filter: string `startDate ge datetime'${sinceDate}T00:00:00'`,
            \$top: 50
        }
    );

    empinfo:EmpEmployment[] employees = response.d?.results ?: [];
    if employees.length() == 0 {
        log:printInfo("No new hires found.");
        return;
    }

    log:printInfo(string `Found ${employees.length()} new hire(s). Sending Slack notifications...`);

    foreach empinfo:EmpEmployment emp in employees {
        string userId = emp.userId ?: "Unknown";
        string startDate = (emp["startDate"] ?: "Unknown").toString();

        json payload = {
            "text": string `:wave: *New Employee Onboarded!*\n• *Employee ID:* ${userId}\n• *Start Date:* ${startDate}\nWelcome to the team!`
        };

        http:Response|error result = slackClient->post("", payload);
        if result is error {
            log:printError(string `Failed to notify Slack for ${userId}: ${result.message()}`);
        } else {
            log:printInfo(string `Slack notification sent for employee: ${userId}`);
        }
    }
}
