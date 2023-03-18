resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  location            = var.location_name
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  admin_enabled       = true
}
