output "resource_group_names" {
  value = values(azurerm_resource_group.new_resource)[*].name
}