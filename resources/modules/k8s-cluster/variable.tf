variable "name" {
  type        = string
  description = "a name of k8s cluster"
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

variable "configuration" {
  type = object({
    vm_size = string
  })
  description = <<EOT
    configuration = {
      vm_size : "size of vm that host k8s"
    }
  EOT
}
