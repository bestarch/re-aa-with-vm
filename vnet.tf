resource "azurerm_virtual_network" "abhi-vnet" {
  name                = "abhi-vnet-${var.prefix}"
  resource_group_name = azurerm_resource_group.abhi-rg.name
  location            = azurerm_resource_group.abhi-rg.location
  address_space       = var.cidr
  tags                = var.tags
}