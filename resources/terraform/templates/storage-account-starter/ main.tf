locals {
  local_data = jsondecode(file("./local-values.json"))
}

module "local_storage_account" {
  source               = "../../modules/storage-account"
  storage_account_name = local.local_data.storage_account_name
  resource_group       = local.local_data.resource_group
}

output "local_storage_account" {
  value = module.local_storage_account.azurerm_storage_account_output
}