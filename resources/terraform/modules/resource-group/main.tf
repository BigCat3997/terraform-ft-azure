resource "azurerm_resource_group" "new_resource" {
  name     = var.resource_group.name
  location = var.resource_group.location
  
  tags = {
    Team      = "DevOps"
    Terraform = true
  }
}