resource "azurerm_virtual_network" "new_resource" {
  name                = var.vnet.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  address_space       = ["10.0.1.0/24"]

  subnet {
    name           = var.vnet.subnet.name
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    environment = "staging"
  }
}