terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.48.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "new_resource" {
  name                     = var.storage_account.name
  resource_group_name      = var.resource_group.name
  location                 = var.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

output "azurerm_storage_account_primary_access_key" {
  value = nonsensitive(azurerm_storage_account.new_resource.primary_access_key)
}