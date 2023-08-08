resource "azurerm_container_registry" "new_resource" {
  name                = var.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = var.sku
  admin_enabled       = true
  tags = {
    Team      = "DevOps"
    Active    = true
    Terraform = true
  }
}
