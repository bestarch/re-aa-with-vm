resource "azurerm_public_ip" "abhi-publicip" {
  #count               = 3
  name                = "abhi-publicip-${var.prefix}"
  resource_group_name = azurerm_resource_group.abhi-rg.name
  location            = azurerm_resource_group.abhi-rg.location
  allocation_method   = "Static"
}