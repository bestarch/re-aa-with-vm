resource "azurerm_network_interface_security_group_association" "abhi-nic-sec-grp" {
  network_interface_id      = azurerm_network_interface.abhi-nic.id
  network_security_group_id = azurerm_network_security_group.abhi-sec-grp.id
}