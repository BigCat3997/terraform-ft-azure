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

# resource "azurerm_resource_group" "new_resource" {
#   name     = var.resource_group.name
#   location = var.resource_group.location

#   tags = {
#     Environment = "Terraform Getting Started"
#     Team        = "DevOps"
#   }
# }

resource "azurerm_application_insights" "new_resource" {
  name                = "ai${regex("-.*$", var.function_app_name)}"
  resource_group_name = azurerm_resource_group.new_resource.name
  location            = azurerm_resource_group.new_resource.location
  application_type    = "web"
}


resource "azurerm_linux_function_app" "new_resource" {
  name                = var.function_app_name
  resource_group_name = azurerm_resource_group.new_resource.name
  location            = azurerm_resource_group.new_resource.location

  storage_account_name       = var.storage_account.name
  storage_account_access_key = var.storage_account.access_key
  service_plan_id            = var.service_plan.id


  site_config {
    cors {
      allowed_origins = ["*"]
    }
    application_insights_key = azurerm_application_insights.new_resource.instrumentation_key
  }
}

#  resource "azurerm_app_service_virtual_network_swift_connection" "example" {
#    app_service_id = azurerm_linux_function_app.example.id
#    subnet_id      = var.input_variables.subnet.id
#  }

#  output "value" {
#    value = base64encode("${azurerm_linux_function_app.example.site_credential[0].name}:${azurerm_linux_function_app.example.site_credential[0].password}")
#  }