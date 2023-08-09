locals {
  local_data = jsondecode(file("./local-values.json"))
}

module "local_service_plan" {
  source            = "../../modules/service-plan"
  service_plan_name = local.local_data.service_plan_name
  resource_group    = local.local_data.resource_group
}

output "local_service_plan_output" {
  value = module.local_service_plan.service_plan_id
}