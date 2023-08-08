locals {
  local_data         = jsondecode(file("./local-data.json"))
  resource_group     = local.local_data.resource_group
  cosmos_db_accounts = local.local_data.cosmos_db_account_names
}

module "local_azurerm_cosmosdb_account" {
  source   = "../../modules/cosmosdb-account"
  for_each = toset(local.local_data.cosmos_db_account_names)

  cosmosdb_account_name = each.key
  resource_group        = local.resource_group
}