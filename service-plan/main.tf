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

resource "azurerm_service_plan" "example" {
  name                = var.service_plan.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  os_type             = "Linux"
  sku_name            = "EP1"
}