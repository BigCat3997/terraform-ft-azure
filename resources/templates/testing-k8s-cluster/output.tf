output "kube_config" {
  value     = values(module.azurerm_kubernetes_cluster)[*].kube_config
  sensitive = true
}