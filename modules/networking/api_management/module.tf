#Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management

resource "azurerm_api_management" "apim" {
  name                = var.settings.name
  location            = var.location
  resource_group_name = var.settings.resource_group_name
  publisher_name      = var.settings.publisher_name
  publisher_email     = var.settings.publisher_email
  sku_name            = var.settings.sku_name
  tags                = try(local.tags, null)
}