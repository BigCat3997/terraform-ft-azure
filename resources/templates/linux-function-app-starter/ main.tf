locals {
  local_data = jsondecode(file("./local-values.json"))
}

module "local_application_insights" {
  source   = "../../modules/application_insights"
  for_each = toset(local.local_data.fa_names)

  application_insights_name = "ai${regex("-.*$", each.value)}"
  resource_group            = local.local_data.resource_group
}

data "azurerm_application_insights" "new_resource" {
  depends_on = [
    module.local_application_insights
  ]
  for_each = toset(local.local_data.fa_names)

  name                = "ai${regex("-.*$", each.value)}"
  resource_group_name = local.local_data.resource_group.name
}

module "local_linux_function_app" {
  depends_on = [
    data.azurerm_application_insights.new_resource
  ]
  source   = "../../modules/function-app/linux-function-app"
  count = length(local.local_data.fa_names)

  function_app_name = local.local_data.fa_names[count.index]
  resource_group    = local.local_data.resource_group
  storage_account   = local.local_data.storage_account
  service_plan_id   = local.local_data.service_plan_id
  rumtime_version   = local.local_data.rumtime_version
  application_insights = {
    key                  = data.azurerm_application_insights.new_resource[local.local_data.fa_names[count.index]].instrumentation_key
    connection_string = data.azurerm_application_insights.new_resource[local.local_data.fa_names[count.index]].connection_string
  }
}