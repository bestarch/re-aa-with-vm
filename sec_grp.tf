resource "azurerm_network_security_group" "abhi-sec-grp" {
  name                = "abhi-sec-grp-${var.prefix}"
  resource_group_name = azurerm_resource_group.abhi-rg.name
  location            = azurerm_resource_group.abhi-rg.location
  security_rule {
    name                       = "allowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = element(var.cidr, 0)
  }

  tags = var.tags
}