## Overview

[SAP SuccessFactors Employee Central](https://www.sap.com/products/hcm/core-hr-payroll.html) is a comprehensive human
capital management solution that helps organizations manage their workforce effectively. It provides a unified platform
for HR processes including employee data management, organizational structures, and employment lifecycle management.

WSO2 SAP Successfactors Ecworkflow provides a way to interact with the [SAP SuccessFactors Workflow API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html). The service allows to manage workflow processes, approvals, and workflow-related operations for employee transactions.

### Key Features

- Manage workflow processes including approval workflows
- Access pending workflow items and workflow notifications
- Query workflow history and process automation records
- Support for basic and OAuth 2.0 authentication

## Setup guide

This connector supports two authentication methods: **Basic Authentication** and **OAuth 2.0 SAML Bearer**.

### Method 1: Basic Authentication

Use your existing SAP SuccessFactors username and password - no additional registration is required.

1. Sign in to your SAP SuccessFactors instance to confirm your username and password.

2. Locate your API server hostname for your SuccessFactors region. You can find the list of API servers in the
   [SAP SuccessFactors API documentation](https://help.sap.com/viewer/d599f15995d348a1b45ba5603e2aba9b/LATEST/en-US/af2b8d5437494b12be88fe374eba75b6.html).

You now have everything you need: your username, password, and hostname.

### Method 2: OAuth 2.0 SAML Bearer

#### Prerequisites

- Administrator access to your SAP SuccessFactors instance's Admin Center.
- An RSA key pair and a matching X.509 certificate. If you don't already have one, generate a self-signed pair with
  OpenSSL:

  ```sh
  openssl req -x509 -newkey rsa:2048 -keyout private_key.pem -out certificate.pem -days 365 -nodes -subj "/CN=YourAppName"
  ```

  `private_key.pem` is secret - it never leaves your machine or gets uploaded anywhere. Only `certificate.pem` is
  registered with SAP.

#### Step 1: Register an OAuth2 client application

1. Sign in to your SAP SuccessFactors instance as an administrator.

2. Search for **Manage OAuth2 Client Applications** in Admin Center's action search, or navigate to it directly under
   **Admin Center** > **Company Settings**.

   ![Search for Manage OAuth2 Client Applications](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/main/docs/setup/sf-2-search-oauth-action.png)

3. Choose **Register Client Application** and provide the following information:

   | Field | Description |
   |-------|-------------|
   | Application Name | A name to identify this integration |
   | Description | An optional description |
   | X.509 Certificate | The contents of `certificate.pem` as a single continuous base64 string, with the `-----BEGIN CERTIFICATE-----` / `-----END CERTIFICATE-----` lines and line breaks removed |

4. Choose **Register** to save the application.

#### Step 2: Note your credentials

After registering, open the application (choose **View** from the application list) to find the **Company ID** and
the **API Key** SAP assigned to it.

![View a registered OAuth2 client application](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/main/docs/setup/sf-3-saml-view-app.png)

You now have everything `sap:SamlBearerAuthConfig` needs:

- **apiKey** - the API Key from the application you just registered
- **companyId** - the Company ID shown on the same screen
- **username** - the SAP user to authenticate as
- **privateKey** - the path to your `private_key.pem` file
- **certificate** - the path to your `certificate.pem` file, or its content
- **tokenUrl** - your Admin Center's OAuth2 token endpoint, typically `https://<admin-center-host>/oauth/token`

## Quickstart

To use the `sap.successfactors.ecworkflow` connector in your Ballerina application, modify the `.bal` file as follows:

### Step 1: Import the module

Import the `sap.successfactors.ecworkflow` module.

```ballerina
import ballerinax/sap.successfactors.ecworkflow as ecwf;
```

### Step 2: Instantiate a new connector

Use the hostname and credentials to initiate a client.

```ballerina
configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

ecwf:Client ecwfClient = check new (
    {
      auth: {
        username,
        password
      }
    },
    hostname
);
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

```ballerina
ecwf:WfRequestWrapper wfRequest = check ecwfClient->getWfRequest();
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The SAP SuccessFactors Employee Central Ballerina connectors provide practical examples illustrating usage in various
scenarios. Explore
these [examples](https://github.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/tree/main/examples),
covering use cases like syncing employee data and sending notifications.

1. [Google Sheets to SuccessFactors](https://github.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/tree/main/examples/google-sheets-to-successfactors) -
   Read employee records from a Google Sheets roster and create Personal Information records in SuccessFactors.

2. [SuccessFactors to Slack](https://github.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/tree/main/examples/successfactors-to-slack) -
   Poll SuccessFactors for newly onboarded employees and send welcome notifications to a Slack channel.
