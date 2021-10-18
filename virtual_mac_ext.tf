
resource "azurerm_virtual_machine_extension" "abhi-test-cmd" {
  name                 = "abhi-test-cmd-${var.prefix}"
  virtual_machine_id   = azurerm_virtual_machine.abhi-vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "script": "${filebase64("scripts/init.sh")}"
    }
    SETTINGS
}