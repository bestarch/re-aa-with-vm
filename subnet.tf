resource "azurerm_subnet" "abhi-subnet" {
  name                 = "abhi-subnet-${var.prefix}"
  resource_group_name  = azurerm_resource_group.abhi-rg.name
  virtual_network_name = azurerm_virtual_network.abhi-vnet.name
  address_prefixes     = var.cidr_vm
}