variable "name" {
  type        = string
  description = "a name of container registry"
}

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

variable "sku" {
  type        = string
  description = "sku of container registry"
}