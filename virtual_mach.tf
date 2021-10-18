
resource "azurerm_virtual_machine" "abhi-vm" {
  name                  = "abhi-vm-${var.prefix}"
  resource_group_name   = azurerm_resource_group.abhi-rg.name
  location              = azurerm_resource_group.abhi-rg.location
  network_interface_ids = [azurerm_network_interface.abhi-nic.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "abhiosdisk-${var.prefix}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = var.username
    admin_password = var.password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = var.tags

  #   provisioner "remote-exec" {
  #     inline = [
  #         "wget http://download.redis.io/redis-stable.tar.gz",
  #         "tar xvzf redis-stable.tar.gz",
  #         "cd redis-stable",
  #         "make redis-cli",
  #         "sudo cp src/redis-cli /usr/local/bin/",
  #         "echo redis_cli_installed > out.txt"

  #     ]
  #   }

  provisioner "file" {
    source      = "scripts/data/"
    destination = "/home/${var.username}"
  }

  connection {
    type     = "ssh"
    user     = var.username
    password = var.password
    host     = azurerm_public_ip.abhi-publicip.ip_address
  }

}
