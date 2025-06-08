resource "azurerm_resource_group" "new" {
  count = var.create_resource_group ? 1 : 0

  name     = var.resource_group_name
  location = var.location
}

data "azurerm_resource_group" "existing" {
  count = var.create_resource_group ? 0 : 1
  name  = var.resource_group_name
}

locals {
  resource_group_name     = var.create_resource_group ? azurerm_resource_group.new[0].name : data.azurerm_resource_group.existing[0].name
  resource_group_location = var.create_resource_group ? azurerm_resource_group.new[0].location : data.azurerm_resource_group.existing[0].location
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.vnet_name
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  address_space       = [var.vnet_address_prefix]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.aks_subnet_address_prefix]
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  dns_prefix          = var.aks_cluster_name

  default_node_pool {
    name           = var.node_pool_name
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = var.aks_identity_type
  }

  kubernetes_version = var.kubernetes_version

  tags = var.tags
}
