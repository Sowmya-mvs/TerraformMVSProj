## [Unreleased]

### Changed
- Terraform core constraint: require Terraform >= 1.6.0 and < 2.0.0 (was ~> 1.3.0) to align with Terraform 1.6+ features and validation improvements.

### Notes
- Provider 'azurerm' remains constrained to ~> 3.40.0 for minimal risk. Consider relaxing to ">= 3.40.0, < 4.0.0" or bumping to the latest 3.x in a follow-up PR after a test plan.
- No resource definitions changed; plan expected to be a no-op.

References: AB#26
