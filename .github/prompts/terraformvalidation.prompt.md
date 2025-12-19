---
agent: agent
---

Execute the following  steps to validate terraform  module as described below.

Step 1:
Analyze this Terraform code and
1. Identify outdated providers
2. Perform safe version auto upgrades 
3. Highlight any breaking changes

Step 2: Environment-safe upgrade
Generate a Terraform version upgrade plan that is safe for dev first, then stage, then prod.

Step 3:
Review this PR and check:
- Terraform variables updated
- Lifecycle rules not broken
- Backward compatibility
- Missing files or references

Step 4:
Generate post-deployment test scenarios for:
- Azure AKS
- Load balancer health
- API availability
- Failover validation

Step 5:
Create a GitHub Actions workflow to run these tests after Terraform apply and publish a report.

