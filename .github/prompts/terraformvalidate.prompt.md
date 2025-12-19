---
agent: agent
---
Execute the following  steps sequentially to validate terraform  module as described below.

Step 1:
Scan the repository for terraform required_version and provider blocks.
Suggest safe version upgrades based on compatibility.
Generate a PR with minimal version bumps and changelog notes in github

Step 2:

Review this PR against:
- Modified Terraform modules
- variables.tf consistency
- lifecycle rules (prevent_destroy)
- tagging standards
- breaking changes
- referenced Azure DevOps requirements workitem number AB#26
- Expected infra changes:
Summarize gaps and risks.






  