variable "cosmosdb_account_name" {
  type        = string
  description = "a name of cosmos database account"
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
    free_tier              = bool
    total_throughput_limit = number
  })

  default = {
    free_tier              = true
    total_throughput_limit = 1000
  }

  description = <<EOT
    configuration = {
      free_tier : "is this resource enable free tier"
      total_throughput_limit : "number of throughput limit"
    }
  EOT
}
