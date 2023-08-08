locals {
  local_data     = jsondecode(file("./local-data.json"))
  resource_group = local.local_data.resource_group
  names          = local.local_data.names
  configuration  = local.local_data.configuration
}

module "azurerm_kubernetes_cluster" {
  source   = "../../modules/k8s-cluster"
  for_each = toset(local.local_data.names)

  name           = each.key
  resource_group = local.resource_group
  configuration  = local.configuration
}