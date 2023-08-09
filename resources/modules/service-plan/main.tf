resource "azurerm_service_plan" "new_resource" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  os_type             = "Linux"
  sku_name            = "EP1"
}