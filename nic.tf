resource "azurerm_network_interface" "abhi-nic" {
  name                = "abhi-nic-${var.prefix}"
  resource_group_name = azurerm_resource_group.abhi-rg.name
  location            = azurerm_resource_group.abhi-rg.location
  tags                = var.tags

  ip_configuration {
    name                          = "abhi-ip-conf-${var.prefix}"
    subnet_id                     = azurerm_subnet.abhi-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.abhi-publicip.id

  }
}