output "instrumentation_key" {
  value = azurerm_application_insights.new_resource.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.new_resource.app_id
}