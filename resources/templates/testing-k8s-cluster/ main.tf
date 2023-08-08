locals {
  local_data        = jsondecode(file("./local-data.json"))
  resource_group    = local.local_data.resource_group
  k8s_cluster_names = local.local_data.k8s_cluster_names
  configuration     = local.local_data.configuration
}

module "azurerm_kubernetes_cluster" {
  source   = "../../modules/k8s_cluster"
  for_each = toset(local.local_data.k8s_cluster_names)

  k8s_cluster_name = each.key
  resource_group   = local.resource_group
  configuration    = local.configuration
}