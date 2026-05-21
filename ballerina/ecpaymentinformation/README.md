## Overview

[SAP SuccessFactors Employee Central](https://www.sap.com/products/hcm/core-hr-payroll.html) is a comprehensive human
capital management solution that helps organizations manage their workforce effectively. It provides a unified platform
for HR processes including employee data management, organizational structures, and employment lifecycle management.

The `ballerinax/sap.successfactors.ecpaymentinformation` package provides APIs to interact with the SAP SuccessFactors Employee Central Payment Information API.

### Key Features

- Manage employee payment information and bank accounts
- Configure payment methods and direct deposit details
- Query payment information across multiple regions
- Support for basic and OAuth 2.0 authentication

## Setup guide

1. Sign in to your SAP SuccessFactors instance as an administrator.

2. Navigate to **Admin Center** > **Manage OAuth2 Client Applications** and register a new OAuth2 client application
   for your integration.

   ![Register OAuth2 App](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/sf-1-register-oauth.png)

3. Note down the **API Key** (client ID) and configure the appropriate scopes for the Employee Central APIs you intend
   to use.

4. Locate your **Company ID** and the API server hostname for your SuccessFactors region. You can find the list of API
   servers in the
   [SAP SuccessFactors API documentation](https://help.sap.com/viewer/d599f15995d348a1b45ba5603e2aba9b/LATEST/en-US/af2b8d5437494b12be88fe374eba75b6.html).

5. Use **Basic Authentication** (username + password) or **OAuth 2.0 SAML Bearer** to authenticate with the API.

## Quickstart

To use the `sap.successfactors.ecpaymentinformation` connector in your Ballerina application, modify the `.bal` file as follows:

### Step 1: Import the module

Import the `sap.successfactors.ecpaymentinformation` module.

```ballerina
import ballerinax/sap.successfactors.ecpaymentinformation as paymentinformation;
```

### Step 2: Instantiate a new connector

Use the hostname and credentials to initiate a client.

```ballerina
configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

paymentinformation:Client paymentinformationClient = check new (
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
paymentinformation:PaymentInformationV3Wrapper result = check paymentinformationClient->listPaymentInformationV3s();
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
