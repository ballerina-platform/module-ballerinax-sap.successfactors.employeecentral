# Ballerina SAP SuccessFactors Employee Central Connectors

[![Build](https://github.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/branch/main/graph/badge.svg)](https://codecov.io/gh/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.successfactors.employeecentral/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/successfactors.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fsuccessfactors)

[SAP SuccessFactors Employee Central](https://www.sap.com/products/hcm/core-hr-payroll.html) is a comprehensive human
capital management solution that helps organizations manage their workforce effectively. It provides a unified platform
for HR processes including employee data management, organizational structures, and employment lifecycle management.

This repository encompasses all Ballerina packages pertaining to the SAP SuccessFactors Employee Central module. Notably:

1. The `ballerinax/sap.successfactors.ecadvances` package provides APIs to interact with the SAP SuccessFactors
   Employee Central Advances API.

2. The `ballerinax/sap.successfactors.ecalternativecostdistribution` package provides APIs that enable seamless
   integration with the [SAP SuccessFactors Alternative Cost Distribution API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
   The service allows to manage employee cost distribution across multiple cost centers and organizational units.

3. The `ballerinax/sap.successfactors.ecapprenticemanagement` package provides APIs that enable seamless integration
   with the [SAP SuccessFactors Apprentice Management API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
   The service allows to manage apprenticeship programs, track apprentice progress, and maintain apprentice-related
   information.

4. The `ballerinax/sap.successfactors.eccompensationinformation` package provides APIs that enable seamless integration
   with the [SAP SuccessFactors Compensation Information API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
   The service allows to manage employee compensation data, salary information, and pay components.

5. The `ballerinax/sap.successfactors.ecdismissalprotection` package provides APIs that enable seamless integration
   with the [SAP SuccessFactors Dismissal Protection API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
   The service allows to manage dismissal protection information for employees, ensuring compliance with labor laws and
   regulations.

6. The `ballerinax/sap.successfactors.ecemployeecentralpayroll` package provides APIs to interact with the SAP
   SuccessFactors Employee Central Payroll API.

7. The `ballerinax/sap.successfactors.ecemployeeprofile` package provides APIs that enable seamless integration with
   the [SAP SuccessFactors Employee Profile API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
   The service allows to maintain the general background information of an employee, including education and outside
   work experiences.

8. The `ballerinax/sap.successfactors.ecemploymentinformation` package provides APIs that enable seamless integration
   with the [SAP SuccessFactors Employment Information API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/d91ecc323849441cb2773fc86f0eff0f.html).
   The service allows to access employment related information, including job information, employment termination, and
   work permit.

9. The `ballerinax/sap.successfactors.ecfoundationorganization` package provides APIs to interact with the SAP
   SuccessFactors Employee Central Foundation Organization API.

10. The `ballerinax/sap.successfactors.ecglobalassignment` package provides APIs to interact with the SAP
    SuccessFactors Employee Central Global Assignment API.

11. The `ballerinax/sap.successfactors.ecglobalbenefits` package provides APIs to interact with the SAP SuccessFactors
    Employee Central Global Benefits API.

12. The `ballerinax/sap.successfactors.ecincometaxdeclaration` package provides APIs to interact with the SAP
    SuccessFactors Employee Central Income Tax Declaration API.

13. The `ballerinax/sap.successfactors.ecmasterdatareplication` package provides APIs that enable seamless integration
    with the [SAP SuccessFactors Master Data Replication API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
    The service allows to replicate and synchronize employee master data across different systems and maintain data
    consistency.

14. The `ballerinax/sap.successfactors.ecpaymentinformation` package provides APIs to interact with the SAP
    SuccessFactors Employee Central Payment Information API.

15. The `ballerinax/sap.successfactors.ecpayrolltimesheets` package provides APIs that enable seamless integration
    with the [SAP SuccessFactors Payroll Time Sheets API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
    The service allows to manage employee time sheet data, working hours, and payroll-related time information.

16. The `ballerinax/sap.successfactors.ecpersonalinformation` package provides APIs to interact with the SAP
    SuccessFactors Employee Central Personal Information API.

17. The `ballerinax/sap.successfactors.ecpositionmanagement` package provides APIs that enable seamless integration
    with the [SAP SuccessFactors Position Management API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
    The service allows to manage organizational positions, position hierarchies, and position-related information.

18. The `ballerinax/sap.successfactors.ecskillsmanagement` package provides APIs that enable seamless integration with
    the [SAP SuccessFactors Skills Management API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
    The service allows to manage employee skills, competencies, job profiles, and skills-related assessments.

19. The `ballerinax/sap.successfactors.ectimeoff` package provides APIs to interact with the SAP SuccessFactors
    Employee Central Time Off API.

20. The `ballerinax/sap.successfactors.ecworkflow` package provides APIs that enable seamless integration with the
    [SAP SuccessFactors Workflow API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
    The service allows to manage workflow processes, approvals, and workflow-related operations for employee
    transactions.

21. The `ballerinax/sap.successfactors.employeecentralec` package provides APIs that enable seamless integration with
    the [SAP SuccessFactors Employee Central Core API v1.0](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/d599f15995d348a1b45ba5603e2aba9b/c508d8543026442d88457f3654b4e91d.html).
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
