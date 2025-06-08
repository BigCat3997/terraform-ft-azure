variable "create_resource_group" {
  description = "Set to true to create a new resource group, false to use an existing one."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group where Cosmos DB resources will be deployed (for new RG creation)."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network."
  type        = string
}

variable "aks_subnet_name" {
  description = "The name of the subnet for the AKS cluster."
  type        = string
}

variable "aks_subnet_address_prefix" {
  description = "The address prefix for the AKS subnet."
  type        = string
}


variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine for the AKS default node pool."
  type        = string
  default     = "Standard_D2_v5" # Recommended: Use a size from the allowed list
}

variable "aks_identity_type" {
  description = "The type of Managed Service Identity to use for the AKS cluster. Options: SystemAssigned, UserAssigned."
  type        = string
  default     = "SystemAssigned"
  validation {
    condition     = contains(["SystemAssigned", "UserAssigned"], var.aks_identity_type)
    error_message = "The aks_identity_type must be either 'SystemAssigned' or 'UserAssigned'."
  }
}

variable "node_pool_name" {
  description = "The name of the default node pool."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use.  Use 'null' for Azure's default."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default = {
    Environment = "Production"
    Project     = "Rookie"
    Terraform   = "True"
  }
}
