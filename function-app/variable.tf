variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
}

variable "storage_account" {
  type = object({
    name       = string
    access_key = string
  })
}

variable "subnet" {
  type = object({
    id = string
  })
}

variable "service_plan" {
  type = object({
    id = string
  })
}

variable "function_app" {
  type = object({
    name = string
  })
}