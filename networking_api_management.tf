#
#
# API Management
#
#

module "api_managements" {
  source   = "./modules/networking/api_management"
  for_each = local.networking.api_management

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  name                = each.value.name
  resource_group_name = local.resource_groups[each.value.resource_group_key].name
  location            = lookup(each.value, "region", null) == null ? local.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  base_tags           = try(local.global_settings.inherit_tags, false) ? local.resource_groups[each.value.resource_group_key].tags : {}
}

# Outputs
output "api_managements" {
  value = module.networking.api_management

  description = "API management output"
}
