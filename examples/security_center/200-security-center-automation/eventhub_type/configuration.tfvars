global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
  }
}

resource_groups = {
  sec_center = {
    name = "sec-center"
  }
}

security_center_automation = {
  automation1 = {
    name               = "sec-center"
    resource_group_key = "sec_center"
    type               = "EventHub"

    actions = {
      action1 = {
        type                   = "EventHub"
        eventhub_namespace_key = "central_logs_region1"
        destination_key        = "central_logs"
      }
      action2 = {
        type              = "LogAnalytics"
        log_analytics_key = "log_analytics_key"
        destination_key   = "central_logs"
      }
    }

    sources = {
      source1 = {
        event_source = "Assessments"
        ruleset = {
          ruleset1 = {
            property_path  = "properties.metadata.severity"
            operator       = "Equals"
            expected_value = "High"
            property_type  = "String"
          }

        }
      }
      source2 = {
        event_source = "Alerts"
      }
    }
  }

}