terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
  required_version = ">= 0.14"
  experiments      = [module_variable_optional_attrs]
}

data "azuread_domains" "aad_domains" {
  only_initial = true
}