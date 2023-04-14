resource "azurerm_storage_account" "new_resource" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group.name
  location                 = var.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}