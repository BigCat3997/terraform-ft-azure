locals {
  local_data     = jsondecode(file("./local-data.json"))
  names          = local.local_data.names
  resource_group = local.local_data.configuration.resource_group
  sku            = local.local_data.configuration.sku
}

module "local_container_registry" {
  source   = "../../modules/container-registry"
  for_each = toset(local.local_data.names)

  name           = each.key
  resource_group = local.resource_group
  sku            = local.sku
}