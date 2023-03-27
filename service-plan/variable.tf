variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
}

variable "service_plan" {
  type = object({
    name     = string
  })
}