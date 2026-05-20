# SAP SuccessFactors Employee Central OpenAPI Specification Sanitization

Author: @RDPerera

## Overview

The SAP SuccessFactors Employee Central APIs are delivered as Swagger 2.0 specifications from the SAP API Hub. These specifications require several sanitization steps before they can be used to generate idiomatic Ballerina connectors using the `bal openapi` tool.

## Sanitization Steps

### 1. Schema Name Sanitization (`sanitations.bal`)

SuccessFactors Swagger 2.0 specs use fully qualified schema names with dots in the `definitions` section (e.g., `SFOData.EmpEmployment`). These cannot be directly mapped to Ballerina type names.

The sanitizer:
- Strips the namespace prefix (everything before the last `.`)
- Removes common suffixes like `_Type`, `Type`, `-create`, `-update`
- Prefixes Create/Update variants appropriately
- Updates all `$ref` references throughout the spec to match renamed definitions

### 2. Response Schema Title Sanitization (`sanitations.bal`)

OData v2 responses wrap results in a `d` envelope with embedded type titles. The sanitizer normalizes titles like `"Collection of EmpEmployment"` → `"CollectionOfEmpEmployment"`.

### 3. Operation ID Generation (`operationId.bal`)

SAP SuccessFactors Swagger 2.0 specs do not include `operationId` fields on path operations. Without these, `bal openapi` cannot generate distinct function names.

The sanitizer generates operation IDs based on the path and HTTP method:
- `GET /EmpEmployment` → `listEmpEmployments` (collection response)
- `GET /EmpEmployment('userId')` → `getEmpEmployment` (single entity)
- `POST /EmpEmployment` → `createEmpEmployment`
- `DELETE /EmpEmployment('userId')` → `deleteEmpEmployment`
- `PATCH /EmpEmployment('userId')` → `patchEmpEmployment`

The function name prefix (`list`/`get`/`create`/`update`/`delete`/`patch`) is determined by the HTTP method and whether the response description is `"Retrieved entities"` (collection) or `"Retrieved entity"` (single).

### 4. Client Sanitization (`clientSanitations.bal`)

After code generation with `bal openapi`, the generated `client.bal` uses a raw `ballerina/http:Client`. This step:
- Replaces `import ballerina/http;` with `import ballerinax/sap;`
- Replaces `http:Client clientEp` with `sap:Client clientEp`
- Replaces the `string serviceUrl` parameter with `string hostname, int port = 443`
- Adds the full service URL construction: `` string serviceUrl = string `https://${hostname}:${port}/successfactors/odata/v2`; ``

The `ballerinax/sap` client provides SAP-specific authentication and connection handling on top of the standard HTTP client.

## Running the Sanitization

### Prerequisites

- Ballerina Swan Lake 2201.13.0 or later
- API specifications in `docs/spec/<apiName>.json`

### Step-by-step Process

1. **Obtain OpenAPI specs** from the [SAP API Hub](https://api.sap.com/package/SuccessFactorsEmployeeCentral/odata) and place them in `docs/spec/`.

2. **Sanitize schema names** for each API:
   ```bash
   cd docs/sanitation
   bal run sanitations.bal -- <apiName>
   ```

3. **Add operation IDs** for each API:
   ```bash
   bal run operationId.bal -- <apiName>
   ```

4. **Generate Ballerina client** from the sanitized spec:
   ```bash
   bal openapi -i docs/spec/<apiName>.json -o ballerina/<moduleName> --mode client
   ```

5. **Sanitize the generated client**:
   ```bash
   cd docs/sanitation
   bal run clientSanitations.bal -- <moduleName> successfactors/odata/v2
   ```

6. **Build and verify**:
   ```bash
   ./gradlew :ballerina:<moduleName>:build
   ```

### Supported Modules

| Module | API Name |
|--------|----------|
| `ecemployeeprofile` | `ecemployeeprofile` |
| `ecemploymentinformation` | `ecemploymentinformation` |
| `ecpersonalinformation` | `ecpersonalinformation` |
| `employeecentralec` | `employeecentralec` |
| `eccompensationinformation` | `eccompensationinformation` |
| `ecalternativecostdistribution` | `ecalternativecostdistribution` |
| `ecglobalbenefits` | `ecglobalbenefits` |
| `ecadvances` | `ecadvances` |
| `ecpositionmanagement` | `ecpositionmanagement` |
| `ecfoundationorganization` | `ecfoundationorganization` |
| `ecglobalassignment` | `ecglobalassignment` |
| `ecmasterdatareplication` | `ecmasterdatareplication` |
| `ecpayrolltimesheets` | `ecpayrolltimesheets` |
| `ectimeoff` | `ectimeoff` |
| `ecemployeecentralpayroll` | `ecemployeecentralpayroll` |
| `ecpaymentinformation` | `ecpaymentinformation` |
| `ecincometaxdeclaration` | `ecincometaxdeclaration` |
| `ecskillsmanagement` | `ecskillsmanagement` |
| `ecapprenticemanagement` | `ecapprenticemanagement` |
| `ecworkflow` | `ecworkflow` |
| `ecdismissalprotection` | `ecdismissalprotection` |
