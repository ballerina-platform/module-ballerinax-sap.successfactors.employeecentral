# Google Sheets to SAP SuccessFactors Employee Central

This example demonstrates how to read employee records from a Google Sheets HR roster and create corresponding
Personal Information records in SAP SuccessFactors Employee Central using the
`sap.successfactors.ecpersonalinformation` connector.

## Overview

Many HR teams maintain employee rosters in Google Sheets before formal onboarding is complete. This integration
bridges the gap by automatically syncing employee biographical data from a spreadsheet into SuccessFactors, reducing
manual data entry and the risk of errors.

The program reads rows from a specified Google Sheet, maps each row to a SuccessFactors `PerPersonal` payload, and
calls the `createPerPersonal` API for each employee.

## Prerequisites

### 1. Setup the SAP SuccessFactors API

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/sap/latest#setup-guide) for necessary credentials
(hostname, username, password).

### 2. Setup Google Sheets

1. Create a Google Cloud project and enable the Google Sheets API.
2. Create OAuth 2.0 credentials (Client ID and Client Secret).
3. Generate a refresh token with the `https://www.googleapis.com/auth/spreadsheets` scope.

Refer to the [Google Sheets connector guide](https://central.ballerina.io/ballerinax/googleapis.sheets/latest) for
detailed setup instructions.

### 3. Prepare the Google Sheet

Create a sheet named `Employees` with the following columns in order:

| A               | B         | C        | D      | E           | F             | G           |
|-----------------|-----------|----------|--------|-------------|---------------|-------------|
| personIdExternal | firstName | lastName | gender | dateOfBirth | countryOfBirth | nationality |

### 4. Configuration

Configure credentials in `Config.toml` in the example directory:

```toml
spreadsheetId = "<Your_Spreadsheet_ID>"
sheetName = "Employees"

[sheetsClientConfig]
clientId = "<Google_Client_ID>"
clientSecret = "<Google_Client_Secret>"
refreshToken = "<Google_Refresh_Token>"
refreshUrl = "https://oauth2.googleapis.com/token"

[sfClientConfig]
hostname = "<SuccessFactors_Hostname>"
username = "<SF_Username>"
password = "<SF_Password>"
```

## Run the Example

Execute the following command to run the example:

```bash
bal run
```

## Testing

1. Add one or more employee rows to your Google Sheet.
2. Run the example.
3. Log into SAP SuccessFactors and verify that Personal Information records were created for each employee.
