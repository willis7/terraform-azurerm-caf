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
  tags                     = try(local.tags, null)
  sku_name                 = var.settings.sku_name
  publisher_name           = var.settings.publisher_name
  publisher_email          = var.settings.publisher_email
  tags                     = local.tags
  virtual_network_type     = try(var.settings.virtual_network_type, null)

  virtual_network_configuration {
    subnet_id = try(var.subnets[var.settings.subnet_key].id,null)
  }

  dynamic additional_location {
    for_each = var.settings.additional_locations
    
    content {
      location = additional_location.value.location
      virtual_network_configuration {
        subnet_id = additional_location.virtual_network_configuration.subnet_id
      }
    }
  }
  
  dynamic certificate {
    for_each = var.settings.certificates 

    content {
      encoded_certificate = certificate.value.encoded_certificate
      certificate_password = certificate.value.certificate_password
      store_name = certificate.value.store_name
    }
  }

  identity = try(var.settings.identity,null)
  hostname_configuration = try(var.settings.hostname_configuration, null)
  notification_sender_email = try(var.settings.notification_sender_email, null)
  
  policy = try(var.settings.policy, null)
  protocols = try(var.settings.protocols, null)
  security = try(var.settings.security, null)

  sign_in = try(var.settings.sign_in,null)
  sign_up = try(var.settings.sign_up,null)
  terms_of_service = try(var.settings.terms_of_service,null)
}
