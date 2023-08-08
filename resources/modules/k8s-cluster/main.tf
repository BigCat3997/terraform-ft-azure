resource "azurerm_kubernetes_cluster" "new_resource" {
  name                = var.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  dns_prefix          = "${var.name}-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.configuration.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Testing"
  }
}