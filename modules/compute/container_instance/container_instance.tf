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
  ip_address_type = try(var.ip_address_type, null)
  network_profile_id = try(var.network_profile_id, null)
  dns_name_label = try(var.dns_name_label, null)
  os_type = var.os_type

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
  
  dynamic "network_profile_id" {

  }
  //1 or more container block
  //network_profile_id if ip type set to Private
  //image_registry_credential
  //restart_policy

  
}

resource "azurerm_network_profile" "aci" {
  name = azurecaf_name.anp.result
  resource_group_name = var.resource_group_name
  location = var.location

  container_network_interface {
    name = "${azurecaf_name.aci.result}-nic"

    ip_configuration {
      name = "${azurecaf_name.aci.result}-ipconfig"
      subnet_id = try(var.vnets[var.client_config.landingzone_key][each.value.vnet_key].subnets[each.value.subnet_key].id, var.vnets[each.value.lz_key][each.value.vnet_key].subnets[each.value.subnet_key].id)
    }
  }
}