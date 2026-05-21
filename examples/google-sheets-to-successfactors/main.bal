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
    sheets:Range range = check sheetsClient->getRange(spreadsheetId, sheetName, "A1:G100");
    (int|string|decimal)[][] rows = range.values;

    if rows.length() <= HEADER_ROW {
        log:printInfo("No employee data found in the sheet.");
        return;
    }

    int successCount = 0;
    int failCount = 0;

    foreach int i in HEADER_ROW ..< rows.length() {
        EmployeeRow|error employee = parseRow(rows[i]);
        if employee is error {
            log:printWarn(string `Skipping row ${i + 1}: ${employee.message()}`);
            failCount += 1;
            continue;
        }

        personalinfo:CreatePerPersonal payload = {
            personIdExternal: employee.personIdExternal,
            firstName: employee.firstName,
            lastName: employee.lastName,
            gender: employee.gender,
            dateOfBirth: employee.dateOfBirth,
            countryOfBirth: employee.countryOfBirth,
            nationality: employee.nationality
        };

        personalinfo:CreatedPerPersonal|error result = sfClient->createPerPersonal(payload);
        if result is error {
            log:printError(string `Failed to create record for ${employee.personIdExternal}: ${result.message()}`);
            failCount += 1;
        } else {
            log:printInfo(string `Created personal information for employee: ${employee.personIdExternal}`);
            successCount += 1;
        }
    }

    log:printInfo(string `Sync complete. Success: ${successCount}, Failed: ${failCount}`);
}

isolated function parseRow((int|string|decimal)[] row) returns EmployeeRow|error {
    if row.length() < 7 {
        return error("Row has fewer than 7 columns");
    }
    return {
        personIdExternal: row[0].toString(),
        firstName: row[1].toString(),
        lastName: row[2].toString(),
        gender: row[3].toString(),
        dateOfBirth: row[4].toString(),
        countryOfBirth: row[5].toString(),
        nationality: row[6].toString()
    };
}
