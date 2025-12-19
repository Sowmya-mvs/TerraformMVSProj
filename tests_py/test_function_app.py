import os
import pytest
import requests

try:
    from azure.identity import ManagedIdentityCredential
    from azure.keyvault.secrets import SecretClient
    AZURE_LIBS = True
except Exception:
    AZURE_LIBS = False

FUNCTION_URL = os.getenv("FUNCTION_URL")  # e.g. https://<app>.azurewebsites.net/api/HttpTrigger
KEYVAULT_URI = os.getenv("KEYVAULT_URI")  # e.g. https://<kv-name>.vault.azure.net

@pytest.mark.skipif(FUNCTION_URL is None, reason="FUNCTION_URL not set")
def test_function_endpoint_ok():
    r = requests.get(FUNCTION_URL, timeout=10)
    assert r.status_code in (200, 202), f"unexpected status: {r.status_code}"

@pytest.mark.skipif(not AZURE_LIBS, reason="azure packages not installed")
@pytest.mark.skipif(KEYVAULT_URI is None, reason="KEYVAULT_URI not set")
def test_keyvault_access_with_msi():
    cred = ManagedIdentityCredential()
    client = SecretClient(vault_url=KEYVAULT_URI, credential=cred)
    # List secrets (requires proper access policy / RBAC)
    pager = client.list_properties_of_secrets()
    # Consume the pager to ensure call succeeds
    _ = list(pager)

@pytest.mark.skipif(FUNCTION_URL is None, reason="FUNCTION_URL not set")
def test_function_404_on_bad_route():
    bad = FUNCTION_URL.rstrip('/') + '/does-not-exist'
    r = requests.get(bad, timeout=10)
    assert r.status_code in (400, 404), f"Expected client error, got {r.status_code}"
