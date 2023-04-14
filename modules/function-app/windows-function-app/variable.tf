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

variable "storage_account" {
  type = object({
    name               = string
    primary_access_key = string
  })
  description = <<EOT
    storage_account = {
      name : "a name of storage account"
      primary_access_key : "a primary access key of storage account"
    }
  EOT
}

variable "rumtime_version" {
  type = object({
    name    = string
    version = string
  })
  description = <<EOT
    rumtime_version = {
      name : "name of runtime core"
      version   : "version of runtime core"
    }
  EOT
}

variable "application_insights" {
  type = object({
    key               = string
    connection_string = string
  })
  description = <<EOT
    rumtime_version = {
      key : "key of application insights"
      connection_string   : "connection string of application insights"
    }
  EOT
}

variable "function_app_name" {
  type        = string
  description = "a name of function app name"
}

variable "service_plan_id" {
  type        = string
  description = "id of service plan"
}
