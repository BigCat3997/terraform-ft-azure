variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = <<EOT
    resource_group = {
      name : "a name of resource group"
      location : "a location of resource group"
    }
  EOT
}

variable "vnet" {
  type = object({
    name = string
    subnet = object({
      name = string
    })
  })
  description = <<EOT
    vnet = {
      name : "a name of vnet"
      subnet = {
        name : "a name of subnet"
      }
    }
  EOT
}