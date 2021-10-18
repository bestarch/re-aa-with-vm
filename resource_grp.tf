
locals {
  location = element("${var.location_us}", 0)
}

resource "azurerm_resource_group" "abhi-rg" {
  name     = var.resource_name
  location = local.location
  tags     = var.tags
}
