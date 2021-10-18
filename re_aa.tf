
locals {
  location_0        = azurerm_resource_group.abhi-rg.location
  location_1        = element("${var.location_us}", 1)
  resource_grp_name = azurerm_resource_group.abhi-rg.name
  subscription_id   = var.subscription_id

  re1_name = "abhi1.test.com"
  re2_name = "abhi2.test.com"
}

resource "azurerm_resource_group_template_deployment" "re-1" {
  name                = local.re1_name
  resource_group_name = var.resource_name
  deployment_mode     = "Incremental"
  template_content = templatefile("./template/re1.json",
    {
      re_name           = local.re1_name,
      location          = local.location_0,
      subscription_id   = local.subscription_id,
      resource_grp_name = local.resource_grp_name
  })

  depends_on = [azurerm_resource_group.abhi-rg]
}

resource "azurerm_resource_group_template_deployment" "re-2" {
  name                = local.re2_name
  resource_group_name = var.resource_name
  deployment_mode     = "Incremental"
  template_content = templatefile("./template/re2.json",
    {
      re_name_1           = local.re1_name,
      re_name_2           = local.re2_name,
      location            = local.location_1,
      re1_deployment_name = local.re1_name,
      subscription_id     = local.subscription_id,
      resource_grp_name   = local.resource_grp_name
  })

  depends_on = [azurerm_resource_group_template_deployment.re-1]
}