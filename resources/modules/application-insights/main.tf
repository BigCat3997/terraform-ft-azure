resource "azurerm_application_insights" "new_resource" {
  name                = var.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  application_type    = "web"
}