module diagnostics {
  source = "../../diagnostics"
  count  = var.diagnostic_profiles == null ? 0 : 1

  resource_id       = azurerm_api_management.apim.id
  resource_location = var.resource_group.location
  diagnostics       = var.diagnostics
  profiles          = var.diagnostic_profiles
}