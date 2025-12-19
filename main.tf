
module "storage" {
  source              = "./modules/storage"
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "keyvault" {
  source              = "./modules/keyvault"
  name                = var.keyvault_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
}

module "function_app" {
  source              = "./modules/function_app"
  name                = var.function_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  storage_account_name = module.storage.name
  storage_account_key  = module.storage.primary_access_key
}
