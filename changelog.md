# Changelog

This file contains all the notable changes done to the Ballerina `sap.successfactors.employeecentral` module.

## [1.0.0] - Unreleased

### Fixed

- Fixed the OData service base path hardcoded in every connector's `client.bal` (and the matching mock servers):
  it was `/successfactors/odata/v2`, but the actual SAP SuccessFactors OData v2 endpoint is `/odata/v2`. Verified
  against a live SuccessFactors tenant — this bug made every connector in this repository unusable against a real
  server out of the box.
- Removed stray `.devcontainer.json` scaffolding files left over in 12 of the 21 modules.
- Removed the outdated root-level `issue_template.md` and `pull_request_template.md`, which duplicated and
  contradicted the actual templates under `.github/`.
- Fixed `pack_and_push_modules.sh`, which only listed 8 of the 21 modules, to cover all of them.
- Rewrote `ballerina/employeecentralec/README.md`, which was a copy of the repository-wide package catalog instead
  of documentation for that module.

### Added

- Added a `release-all.yml` workflow to release every connector package in one dispatch, matching the pattern
  used in `module-ballerinax-sap.businessone`.

### Changed

- Bumped every connector package to version `1.0.0` (from `0.9.0`).
- Bumped the Ballerina distribution to `2201.12.0` (from `2201.13.0`) in every module.