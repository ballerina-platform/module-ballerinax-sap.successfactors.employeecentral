# Ballerina SAP SuccessFactors Employee Central Connectors

[![Build](https://github.com/RDPerera/module-ballerinax-sap.successfactors.employeecentral/actions/workflows/ci.yml/badge.svg)](https://github.com/RDPerera/module-ballerinax-sap.successfactors.employeecentral/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/RDPerera/module-ballerinax-sap.successfactors.employeecentral/branch/main/graph/badge.svg)](https://codecov.io/gh/RDPerera/module-ballerinax-sap.successfactors.employeecentral)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/RDPerera/module-ballerinax-sap.successfactors.employeecentral.svg)](https://github.com/RDPerera/module-ballerinax-sap.successfactors.employeecentral/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/successfactors.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fsuccessfactors)

[SAP SuccessFactors Employee Central](https://www.sap.com/products/hcm/core-hr-payroll.html) is a comprehensive human
capital management solution that helps organizations manage their workforce effectively. It provides a unified platform
for HR processes including employee data management, organizational structures, and employment lifecycle management.

This repository encompasses all Ballerina packages pertaining to the SAP SuccessFactors Employee Central module. Each
package provides seamless integration with specific Employee Central APIs.

## Available Packages

### Core Employee Management

| Module | Package | Description |
|--------|---------|-------------|
| `ecemployeeprofile` | `ballerinax/sap.successfactors.ecemployeeprofile` | Employee profile information including personal details, education background, and work experience. |
| `ecemploymentinformation` | `ballerinax/sap.successfactors.ecemploymentinformation` | Employment-related information including job details, employment status, termination data, and work permits. |
| `ecpersonalinformation` | `ballerinax/sap.successfactors.ecpersonalinformation` | Personal information including biographical data, addresses, contacts, national IDs, and social accounts. |
| `employeecentralec` | `ballerinax/sap.successfactors.employeecentralec` | Core Employee Central APIs for comprehensive employee data management and organizational structure operations. |

### Compensation and Benefits

| Module | Package | Description |
|--------|---------|-------------|
| `eccompensationinformation` | `ballerinax/sap.successfactors.eccompensationinformation` | Compensation data including salary information, pay scales, and compensation planning. |
| `ecalternativecostdistribution` | `ballerinax/sap.successfactors.ecalternativecostdistribution` | Alternative cost distribution scenarios for employee expenses and cost center allocations. |
| `ecglobalbenefits` | `ballerinax/sap.successfactors.ecglobalbenefits` | Comprehensive benefits management including insurance plans, savings plans, pension funds, and company cars. |
| `ecadvances` | `ballerinax/sap.successfactors.ecadvances` | Employee salary advances, advance eligibility, accumulation, and installment schedules. |

### Position and Organizational Management

| Module | Package | Description |
|--------|---------|-------------|
| `ecpositionmanagement` | `ballerinax/sap.successfactors.ecpositionmanagement` | Position management including position creation, hierarchy management, and organizational structure. |
| `ecfoundationorganization` | `ballerinax/sap.successfactors.ecfoundationorganization` | Foundation objects including legal entities, departments, divisions, job classifications, and cost centers. |
| `ecglobalassignment` | `ballerinax/sap.successfactors.ecglobalassignment` | Global assignment data for internationally mobile employees. |
| `ecmasterdatareplication` | `ballerinax/sap.successfactors.ecmasterdatareplication` | Master data replication across Employee Central systems for data consistency. |

### Time and Payroll

| Module | Package | Description |
|--------|---------|-------------|
| `ecpayrolltimesheets` | `ballerinax/sap.successfactors.ecpayrolltimesheets` | Payroll timesheet data including time tracking, attendance records, and payroll processing. |
| `ectimeoff` | `ballerinax/sap.successfactors.ectimeoff` | Time off and leave management including time accounts, holiday calendars, and work schedules. |
| `ecemployeecentralpayroll` | `ballerinax/sap.successfactors.ecemployeecentralpayroll` | Employee Central Payroll run results and payroll processing data. |
| `ecpaymentinformation` | `ballerinax/sap.successfactors.ecpaymentinformation` | Payment information including bank accounts, payment methods, and direct deposit details. |
| `ecincometaxdeclaration` | `ballerinax/sap.successfactors.ecincometaxdeclaration` | Income tax declaration management including investment declarations and fiscal year configurations. |

### Learning and Development

| Module | Package | Description |
|--------|---------|-------------|
| `ecskillsmanagement` | `ballerinax/sap.successfactors.ecskillsmanagement` | Skills and competency management including skill profiles, competency frameworks, and talent tracking. |
| `ecapprenticemanagement` | `ballerinax/sap.successfactors.ecapprenticemanagement` | Apprentice program management including registration, progress tracking, and program administration. |

### Workflow and Legal

| Module | Package | Description |
|--------|---------|-------------|
| `ecworkflow` | `ballerinax/sap.successfactors.ecworkflow` | Workflow processes including approval workflows, notifications, and process automation. |
| `ecdismissalprotection` | `ballerinax/sap.successfactors.ecdismissalprotection` | Dismissal protection and termination compliance features including legal requirements and documentation. |

## Examples

The [`examples`](https://github.com/RDPerera/module-ballerinax-sap.successfactors.employeecentral/tree/main/examples)
directory contains practical integration examples:

1. [Google Sheets to SuccessFactors](https://github.com/RDPerera/module-ballerinax-sap.successfactors.employeecentral/tree/main/examples/google-sheets-to-successfactors) —
   Read employee records from a Google Sheets roster and create Personal Information records in SuccessFactors.

2. [SuccessFactors to Slack](https://github.com/RDPerera/module-ballerinax-sap.successfactors.employeecentral/tree/main/examples/successfactors-to-slack) —
   Poll SuccessFactors for newly onboarded employees and send welcome notifications to a Slack channel.

## Issues and projects

The **Issues** and **Projects** tabs are disabled for this repository as this is part of the Ballerina library. To
report bugs, request new features, start new discussions, view project boards, etc., visit the Ballerina
library [parent repository](https://github.com/ballerina-platform/ballerina-library).

## Build from the source

### Prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following
   sources:

   * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
   * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was
   installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

### Build options

Execute the commands below to build from the source.

1. To build all packages:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests in all packages:

   ```bash
   ./gradlew clean test
   ```

3. To build without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To build only one specific package:

   ```bash
   ./gradlew clean :ballerina:<module_name>:build
   ```

   | Module Name                    | Connector                                                   |
   |--------------------------------|-------------------------------------------------------------|
   | ecemployeeprofile              | ballerinax/sap.successfactors.ecemployeeprofile             |
   | ecemploymentinformation        | ballerinax/sap.successfactors.ecemploymentinformation       |
   | ecpersonalinformation          | ballerinax/sap.successfactors.ecpersonalinformation         |
   | employeecentralec              | ballerinax/sap.successfactors.employeecentralec             |
   | eccompensationinformation      | ballerinax/sap.successfactors.eccompensationinformation     |
   | ecalternativecostdistribution  | ballerinax/sap.successfactors.ecalternativecostdistribution |
   | ecglobalbenefits               | ballerinax/sap.successfactors.ecglobalbenefits              |
   | ecadvances                     | ballerinax/sap.successfactors.ecadvances                    |
   | ecpositionmanagement           | ballerinax/sap.successfactors.ecpositionmanagement          |
   | ecfoundationorganization       | ballerinax/sap.successfactors.ecfoundationorganization      |
   | ecglobalassignment             | ballerinax/sap.successfactors.ecglobalassignment            |
   | ecmasterdatareplication        | ballerinax/sap.successfactors.ecmasterdatareplication       |
   | ecpayrolltimesheets            | ballerinax/sap.successfactors.ecpayrolltimesheets           |
   | ectimeoff                      | ballerinax/sap.successfactors.ectimeoff                     |
   | ecemployeecentralpayroll       | ballerinax/sap.successfactors.ecemployeecentralpayroll      |
   | ecpaymentinformation           | ballerinax/sap.successfactors.ecpaymentinformation          |
   | ecincometaxdeclaration         | ballerinax/sap.successfactors.ecincometaxdeclaration        |
   | ecskillsmanagement             | ballerinax/sap.successfactors.ecskillsmanagement            |
   | ecapprenticemanagement         | ballerinax/sap.successfactors.ecapprenticemanagement        |
   | ecworkflow                     | ballerinax/sap.successfactors.ecworkflow                    |
   | ecdismissalprotection          | ballerinax/sap.successfactors.ecdismissalprotection         |

5. To run tests against a live server:

   ```bash
   IS_TEST_ON_SUCCESSFACTORS_SERVER=true ./gradlew clean test
   ```

6. To debug with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToLocalCentral=true
   ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`sap.successfactors` package](https://lib.ballerina.io/ballerinax/sap.successfactors/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
