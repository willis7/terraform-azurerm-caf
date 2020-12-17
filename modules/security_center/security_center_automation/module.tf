resource "azurecaf_name" "sec_center_automation" {
  name          = var.settings.name
  resource_type = "azurerm_eventhub"
  prefixes      = [var.global_settings.prefix]
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_security_center_automation" "sca" {
  name                = azurecaf_name.sec_center_automation.result
  location            = var.location
  resource_group_name = var.resource_group_name
  description         = try(var.settings.description, null)
  enabled             = try(var.settings.enabled, true)

  dynamic "action" {
    for_each = var.settings.actions
    content {
      type = action.value.type
      #Required in all cases (EventHub, LogAnalytics, LogApps)
      resource_id = action.value.type == "EventHub" ? var.diagnostics.event_hub_namespaces[var.diagnostics.diagnostics_destinations.event_hub_namespaces[action.value.destination_key].event_hub_namespace_key].id : (action.value.type == "LogAnalytics" ? var.diagnostics.log_analytics[var.diagnostics.diagnostics_destinations.log_analytics[action.value.destination_key].log_analytics_key].id : null)
      #Required for EVH
      connection_string = action.value.type == "EventHub" ? try(var.diagnostics.event_hub_namespaces[var.diagnostics.diagnostics_destinations.event_hub_namespaces[action.value.destination_key].event_hub_namespace_key].connection_string_primary, var.diagnostics.event_hub_namespaces[var.diagnostics.diagnostics_destinations.event_hub_namespaces[action.value.destination_key].event_hub_namespace_key].connection_string_secondary) : null
      #Required for LogicApp
      #support for 'LogicApps" coming soon
      #trigger_url = action.value.type == "LogicApp" try(something, null) : null
    }
  }

  dynamic "source" {
    for_each = var.settings.sources
    content {
      event_source = source.value.event_source
      dynamic "rule_set" {
        for_each = try(var.settings.source.ruleset, {})
        content {
          rule {
            property_path  = source.ruleset.value.property_path
            operator       = source.ruleset.value.operator
            expected_value = source.ruleset.value.expected_value
            property_type  = source.ruleset.value.property_type
          }
        }
      }
    }
  }

  #need to change scope to accomodate lists and also RG type
  scopes = ["/subscriptions/${var.subscription_id}"]
  tags   = local.tags
}