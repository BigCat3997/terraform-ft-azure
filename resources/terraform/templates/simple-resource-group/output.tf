output "resource_group_name" {
  value = values(module.local_resource_group)[*].resource_group_name
}