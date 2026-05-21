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
import ballerina/runtime;
import ballerina/task;
import ballerina/time;
import ballerinax/slack;
import ballerinax/sap.successfactors.ecemploymentinformation as empinfo;

configurable SFClientConfig sfClientConfig = ?;
configurable SlackClientConfig slackClientConfig = ?;
configurable string slackChannel = "#hr-announcements";
configurable int pollIntervalSeconds = 3600;

final empinfo:Client sfClient = check new (
    config = {
        auth: {
            username: sfClientConfig.username,
            password: sfClientConfig.password
        }
    },
    hostname = sfClientConfig.hostname
);

final slack:Client slackClient = check new ({
    auth: {
        token: slackClientConfig.token
    }
});

string lastChecked = "";

public function main() returns error? {
    lastChecked = formatDate(time:utcNow());
    log:printInfo(string `Starting SuccessFactors → Slack notifier. Polling every ${pollIntervalSeconds}s.`);

    task:JobId _ = check task:scheduleOneTimeJob(new PollJob(), time:utcAddSeconds(time:utcNow(), pollIntervalSeconds));

    check pollAndNotify();

    runtime:sleep(float:MAX_VALUE);
}

class PollJob {
    *task:Job;

    public function execute() {
        error? result = pollAndNotify();
        if result is error {
            log:printError("Poll failed: " + result.message());
        }
    }
}

function pollAndNotify() returns error? {
    string today = formatDate(time:utcNow());
    log:printInfo(string `Checking for new hires with startDate >= ${lastChecked}`);

    empinfo:Wrapper_1|error response = sfClient->listEmpEmployments(
        queries = {
            \$filter: string `startDate ge datetime'${lastChecked}T00:00:00'`,
            \$top: 50
        }
    );

    if response is error {
        log:printError("Failed to fetch employment records: " + response.message());
        return response;
    }

    empinfo:EmpEmployment[] employees = response.d?.results ?: [];
    if employees.length() == 0 {
        log:printInfo("No new hires found.");
        lastChecked = today;
        return;
    }

    foreach empinfo:EmpEmployment emp in employees {
        string userId = emp.userId ?: "Unknown";
        string startDate = (emp["startDate"] ?: "Unknown").toString();
        string message = string `:wave: *New Employee Onboarded!*\n• *Employee ID:* ${userId}\n• *Start Date:* ${startDate}\nWelcome to the team!`;

        slack:Message slackMsg = {
            channelName: slackChannel,
            text: message
        };

        string|error msgResult = slackClient->postMessage(slackMsg);
        if msgResult is error {
            log:printError(string `Failed to send Slack notification for ${userId}: ${msgResult.message()}`);
        } else {
            log:printInfo(string `Sent welcome notification for employee: ${userId}`);
        }
    }

    lastChecked = today;
}

isolated function formatDate(time:Utc utc) returns string {
    time:Civil civil = time:utcToCivil(utc);
    return string `${civil.year}-${civil.month < 10 ? "0" : ""}${civil.month}-${civil.day < 10 ? "0" : ""}${civil.day}`;
}
