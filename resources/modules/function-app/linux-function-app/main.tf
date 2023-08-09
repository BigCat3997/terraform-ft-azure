resource "azurerm_linux_function_app" "new_resource" {
  name                = var.function_app_name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  storage_account_name                   = var.storage_account.name
  storage_account_access_key             = var.storage_account.primary_access_key
  service_plan_id                        = var.service_plan_id

  site_config {
    application_insights_connection_string = var.application_insights.connection_string
    application_insights_key               = var.application_insights.key

    cors {
      allowed_origins = ["*"]
    }

    application_stack {
      dotnet_version = var.rumtime_version.name == "dotnet" ? var.rumtime_version.version : null
      java_version   = var.rumtime_version.name == "java" ? var.rumtime_version.version : null
      node_version   = var.rumtime_version.name == "node" ? var.rumtime_version.version : null
      python_version = var.rumtime_version.name == "python" ? var.rumtime_version.version : null
    }
  }
}