resource "azurerm_cosmosdb_account" "new_resource" {
  name                      = var.cosmosdb_account_name
  location                  = var.resource_group.location
  resource_group_name       = var.resource_group.name
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  enable_automatic_failover = false
  enable_free_tier          = var.configuration.free_tier

  geo_location {
    location          = var.resource_group.location
    failover_priority = 0
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  capacity {
    total_throughput_limit = var.configuration.total_throughput_limit
  }
}
