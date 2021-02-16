resource "azurecaf_name" "aci" {
  name          = var.name
  resource_type = "azurerm_container_instance"
  prefixes      = [var.global_settings.prefix]
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_container_group" "aci" {
  name = azurecaf_name.aci.result
  resource_group_name = var.resource_group_name
  location = var.location
  ip_address_type = var.ip_address_type // optional, Public or Private
  dns_name_label = var.dns_name_label // optional, not supported if using vNet
  os_type = var.os_type // required, if Windows, only 1 container block

  dynamic "identity" {
    for_each = try(var.identity, {})

    content {
      type = var.identity.type
      
      dynamic "identity_ids" {
        for_each = try(var.identity.value.identity_ids, {})

        content {
          identity_ids = var.identity.value.identity_ids
        }
      }
    }
  }
  
  //1 or more container block
  //network_profile_id if ip type set to Private
  //image_registry_credential
  //restart_policy

  
}