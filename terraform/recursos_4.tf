resource "azurerm_kubernetes_cluster" "akc" {
  name                = var.kubernetes_cluster_name
  location            = var.location_name
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix_name

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "ara" {
  principal_id         = azurerm_kubernetes_cluster.akc.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}
