# Ballerina SAP SuccessFactors Employee Central Connectors

[![Build](https://github.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/successfactors.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fsuccessfactors)

[SAP SuccessFactors Employee Central](https://www.sap.com/products/hcm/core-hr-payroll.html) is a comprehensive human
capital management solution that helps organizations manage their workforce effectively. It provides a unified platform
for HR processes including employee data management, organizational structures, and employment lifecycle management.

This repository encompasses all Ballerina packages pertaining to the SAP SuccessFactors Employee Central module. Notably:

1. [SAP SuccessFactors Employee Central Advances](ballerina/ecadvances) provides a way to interact with the
   [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).

2. [SAP SuccessFactors Employee Central Alternative Cost Distribution](ballerina/ecalternativecostdistribution)
   provides a way to interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
   The service allows to manage employee cost distribution across multiple cost centers and organizational units.

3. [SAP SuccessFactors Employee Central Apprentice Management](ballerina/ecapprenticemanagement) provides a way to
   interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
   The service allows to manage apprenticeship programs, track apprentice progress, and maintain apprentice-related
   information.

4. [SAP SuccessFactors Employee Central Compensation Information](ballerina/eccompensationinformation) provides a way
   to interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
   The service allows to manage employee compensation data, salary information, and pay components.

5. [SAP SuccessFactors Employee Central Dismissal Protection](ballerina/ecdismissalprotection) provides a way to
   interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
   The service allows to manage dismissal protection information for employees, ensuring compliance with labor laws and
   regulations.

6. [SAP SuccessFactors Employee Central Payroll](ballerina/ecemployeecentralpayroll) provides a way to interact with
   the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).

7. [SAP SuccessFactors Employee Central Employee Profile](ballerina/ecemployeeprofile) provides a way to interact
   with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
   The service allows to maintain the general background information of an employee, including education and outside
   work experiences.

8. [SAP SuccessFactors Employee Central Employment Information](ballerina/ecemploymentinformation) provides a way to
   interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
   The service allows to access employment related information, including job information, employment termination, and
   work permit.

9. [SAP SuccessFactors Employee Central Foundation Organization](ballerina/ecfoundationorganization) provides a way
   to interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).

10. [SAP SuccessFactors Employee Central Global Assignment](ballerina/ecglobalassignment) provides a way to interact
    with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).

11. [SAP SuccessFactors Employee Central Global Benefits](ballerina/ecglobalbenefits) provides a way to interact with
    the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).

12. [SAP SuccessFactors Employee Central Income Tax Declaration](ballerina/ecincometaxdeclaration) provides a way to
    interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).

13. [SAP SuccessFactors Employee Central Master Data Replication](ballerina/ecmasterdatareplication) provides a way
    to interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
    The service allows to replicate and synchronize employee master data across different systems and maintain data
    consistency.

14. [SAP SuccessFactors Employee Central Payment Information](ballerina/ecpaymentinformation) provides a way to
    interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).

15. [SAP SuccessFactors Employee Central Payroll Time Sheets](ballerina/ecpayrolltimesheets) provides a way to
    interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
    The service allows to manage employee time sheet data, working hours, and payroll-related time information.

16. [SAP SuccessFactors Employee Central Personal Information](ballerina/ecpersonalinformation) provides a way to
    interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).

17. [SAP SuccessFactors Employee Central Position Management](ballerina/ecpositionmanagement) provides a way to
    interact with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
    The service allows to manage organizational positions, position hierarchies, and position-related information.

18. [SAP SuccessFactors Employee Central Skills Management](ballerina/ecskillsmanagement) provides a way to interact
    with the [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
    The service allows to manage employee skills, competencies, job profiles, and skills-related assessments.

19. [SAP SuccessFactors Employee Central Time Off](ballerina/ectimeoff) provides a way to interact with the
    [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).

20. [SAP SuccessFactors Employee Central Workflow](ballerina/ecworkflow) provides a way to interact with the
    [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
    The service allows to manage workflow processes, approvals, and workflow-related operations for employee
    transactions.

21. [SAP SuccessFactors Employee Central Core](ballerina/employeecentralec) provides a way to interact with the
    [SAP SuccessFactors Employee Central APIs](https://api.sap.com/package/SuccessFactorsEmployeeCentral/overview).
    The service provides comprehensive access to core employee central functionalities and global employee information.

## Issues and projects

The **Issues** and **Projects** tabs are disabled for this repository as this is part of the Ballerina library. To
report bugs, request new features, start new discussions, view project boards, etc., visit the Ballerina
library [parent repository](https://github.com/ballerina-platform/ballerina-library).

This repository only contains the source code for the package.

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
   ./gradlew clean :employeecentral-ballerina:<module_name>:build
   ```

   | Module Name                    | Connector                                                   |
   |--------------------------------|-------------------------------------------------------------|
   | ecadvances                     | ballerinax/sap.successfactors.ecadvances                    |
   | ecalternativecostdistribution  | ballerinax/sap.successfactors.ecalternativecostdistribution |
   | ecapprenticemanagement         | ballerinax/sap.successfactors.ecapprenticemanagement        |
   | eccompensationinformation      | ballerinax/sap.successfactors.eccompensationinformation     |
   | ecdismissalprotection          | ballerinax/sap.successfactors.ecdismissalprotection         |
   | ecemployeecentralpayroll       | ballerinax/sap.successfactors.ecemployeecentralpayroll      |
   | ecemployeeprofile              | ballerinax/sap.successfactors.ecemployeeprofile             |
   | ecemploymentinformation        | ballerinax/sap.successfactors.ecemploymentinformation       |
   | ecfoundationorganization       | ballerinax/sap.successfactors.ecfoundationorganization      |
   | ecglobalassignment             | ballerinax/sap.successfactors.ecglobalassignment            |
   | ecglobalbenefits               | ballerinax/sap.successfactors.ecglobalbenefits              |
   | ecincometaxdeclaration         | ballerinax/sap.successfactors.ecincometaxdeclaration        |
   | ecmasterdatareplication        | ballerinax/sap.successfactors.ecmasterdatareplication       |
   | ecpaymentinformation           | ballerinax/sap.successfactors.ecpaymentinformation          |
   | ecpayrolltimesheets            | ballerinax/sap.successfactors.ecpayrolltimesheets           |
   | ecpersonalinformation          | ballerinax/sap.successfactors.ecpersonalinformation         |
   | ecpositionmanagement           | ballerinax/sap.successfactors.ecpositionmanagement          |
   | ecskillsmanagement             | ballerinax/sap.successfactors.ecskillsmanagement            |
   | ectimeoff                      | ballerinax/sap.successfactors.ectimeoff                     |
   | ecworkflow                     | ballerinax/sap.successfactors.ecworkflow                    |
   | employeecentralec              | ballerinax/sap.successfactors.employeecentralec             |

5. To run tests against a live server:

   ```bash
   IS_TEST_ON_SUCCESSFACTORS_SERVER=true ./gradlew clean test
   ```

   **Note**: `IS_TEST_ON_SUCCESSFACTORS_SERVER` is false by default, tests are run against the mock server.

6. To debug packages with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

7. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

8. Publish the generated artifacts to the local Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToLocalCentral=true
   ```

9. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`sap` package](https://lib.ballerina.io/ballerinax/sap/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
