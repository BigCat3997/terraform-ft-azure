output "value" {
  value = base64encode("${azurerm_linux_function_app.new_resource.site_credential[0].name}:${azurerm_linux_function_app.new_resource.site_credential[0].password}")
}