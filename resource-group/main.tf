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

resource "azurerm_resource_group" "new_resource" {
  name     = var.resource_group.name
  location = var.resource_group.location

  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}