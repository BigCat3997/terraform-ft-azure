locals {
  local_data = jsondecode(file("./local-values.json"))
}

module "local_resource_group" {
  source = "../../modules/resource-group"
  for_each = tomap({
    for t in local.local_data.resource_groups :
    "${t.name}:${t.location}" => t
  })

  resource_group = each.value
}