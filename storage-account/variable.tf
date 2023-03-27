variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
}

variable "storage_account" {
  type = object({
    name = string
  })
}