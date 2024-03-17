variable "resource_groups" {
  description = "Resource groups"
  type = map(object({
    location = string
  }))
}

variable "tags" {
  description = "Tags of resource groups"
  type        = map(string)
  default     = {}
}
