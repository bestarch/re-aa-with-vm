output "vm_details" {
  value = {
    ip = azurerm_public_ip.abhi-publicip.ip_address
    vm = azurerm_virtual_machine.abhi-vm.name
  }

}



