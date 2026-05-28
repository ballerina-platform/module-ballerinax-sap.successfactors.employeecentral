# Google Sheets to SAP SuccessFactors Employee Central

This example demonstrates how to read employee IDs from a Google Sheets roster and look up the corresponding
Personal Information records in SAP SuccessFactors Employee Central using the
`sap.successfactors.ecpersonalinformation` connector.

## Overview

HR teams often maintain an employee roster in Google Sheets. This integration reads person IDs from column A of the
sheet, queries SuccessFactors for each employee's personal information, and logs the results — making it easy to
verify which employees are already onboarded in the system.

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

Create a sheet named `Employees` with `personIdExternal` values in column A (row 1 is the header):

| A                |
|------------------|
| personIdExternal |
| EMP001           |
| EMP002           |

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

1. Add one or more `personIdExternal` values to column A of your Google Sheet.
2. Run the example.
3. Check the logs — matched employees show their name and gender; unmatched IDs are logged as warnings.
