output "azurerm_storage_account_output" {
  value = {
    "id"                 = azurerm_storage_account.new_resource.id
    "name"               = azurerm_storage_account.new_resource.name
    "primary_access_key" = nonsensitive(azurerm_storage_account.new_resource.primary_access_key)
  }
}