output "cosmosdb_account_output" {
  value = values(module.local_azurerm_cosmosdb_account)[*].cosmosdb_account_name
}