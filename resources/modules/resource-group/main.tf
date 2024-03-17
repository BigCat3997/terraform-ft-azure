resource "azurerm_resource_group" "new_resource" {
  for_each = var.resource_groups

  name     = each.key
  location = each.value.location

  tags = var.tags
}
