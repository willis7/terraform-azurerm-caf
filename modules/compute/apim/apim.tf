resource "azurecaf_name" "apim" {
  name          = var.settings.name
  resource_type = "azurerm_api_management_service"
  prefixes      = [var.global_settings.prefix]
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_api_management" "apim" {
  name                     = azurecaf_name.apim.result
  resource_group_name      = var.resource_group.name
  location                 = var.resource_group.location
  sku_name                 = var.settings.sku_name
  publisher_name           = var.settings.publisher_name
  publisher_email          = var.settings.publisher_email
  tags                     = local.tags
  virtual_network_configuration {
    subnet_id = var.subnets[var.settings.subnet_key].id
  }
}
