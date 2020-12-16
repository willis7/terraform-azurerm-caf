output api_managements {
  value     = module.aks_clusters
  sensitive = true
}

module api_managements {
  source   = "./modules/compute/apim"
  for_each = local.compute.api_managements

  global_settings     = local.global_settings
  diagnostics         = local.combined_diagnostics
  diagnostic_profiles = try(each.value.diagnostic_profiles, {})
  base_tags           = try(local.global_settings.inherit_tags, false) ? module.resource_groups[each.value.resource_group_key].tags : {}
  settings            = each.value
  subnets             = lookup(each.value, "lz_key", null) == null ? local.combined_objects_networking[local.client_config.landingzone_key][each.value.vnet_key].subnets : local.combined_objects_networking[each.value.lz_key][each.value.vnet_key].subnets
  resource_group      = module.resource_groups[each.value.resource_group_key]

}
