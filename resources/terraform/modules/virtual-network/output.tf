output "subnet_id" {
  value = azurerm_virtual_network.new_resource.subnet.*.id
}