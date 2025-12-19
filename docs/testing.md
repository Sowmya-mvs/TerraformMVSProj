# Post-deployment testing

## Terraform tests (Terraform 1.6+)

Requires Terraform >= 1.6.0.

Run:

`sh
terraform init -upgrade
terraform test
`

## Python tests

`sh
python -m venv .venv
. .venv/Scripts/Activate.ps1  # Windows
pip install -r tests_py/requirements.txt

# Provide environment variables
 = "https://<app>.azurewebsites.net/api/HttpTrigger"
  = "https://<kv>.vault.azure.net"

pytest -q tests_py
`

Notes:
- MSI tests require running in Azure context with Managed Identity available (e.g., in a GitHub Actions job on a self-hosted runner with agent MSI, or from a VM/ACI/Function with MSI).
- For local dev, consider using Azure CLI credential with DefaultAzureCredential if appropriate.
