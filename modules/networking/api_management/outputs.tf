output "id" {
  value       = azurerm_api_management.apim.id
  description = "The ID of the API Management Service."
}

output "additional_location" {
  value       = azurerm_api_management.apim.additional_location
  description = "Zero or more additional_location blocks."
}

output "gateway_url" {
  value       = azurerm_api_management.apim.gateway_url
  description = "The URL of the Gateway for the API Management Service."
}

output "gateway_regional_url" {
  value       = azurerm_api_management.apim.gateway_regional_url
  description = "The Region URL for the Gateway of the API Management Service."
}

output "management_api_url" {
  value       = azurerm_api_management.apim.management_api_url
  description = "The URL for the Management API associated with this API Management service."
}

output "portal_url" {
  value       = azurerm_api_management.apim.portal_url
  description = "The URL for the Publisher Portal associated with this API Management service."
}