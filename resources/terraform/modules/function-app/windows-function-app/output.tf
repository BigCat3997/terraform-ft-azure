output "value" {
  value = base64encode("${azurerm_windows_function_app.new_resource.site_credential[0].name}:${azurerm_windows_function_app.new_resource.site_credential[0].password}")
}