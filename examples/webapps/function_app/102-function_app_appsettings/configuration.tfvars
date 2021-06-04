global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
  }
}

resource_groups = {
  funapp = {
    name   = "funapp-private"
    region = "region1"
  }
  spoke = {
    name   = "spoke"
    region = "region1"
  }
}

# By default asp1 will inherit from the resource group location
app_service_plans = {
  asp1 = {
    resource_group_key = "funapp"
    name               = "asp-simple"

    sku = {
      tier = "Standard"
      size = "S1"
    }
  }
}


function_apps = {
  functionapp1 = {
    resource_group_key      = "funapp"
    region                  = "region1"
    name                    = "funapp-appsettings"
    app_service_plan_key    = "asp1"
    storage_account_key     = "funcapp_sa"
 
    settings = {
      enabled = true
    }

    app_settings = {
      FUNCTIONS_EXTENSION_VERSION = "~3"
      FUNCTIONS_WORKER_RUNTIME = "python"
    }
  }
}
