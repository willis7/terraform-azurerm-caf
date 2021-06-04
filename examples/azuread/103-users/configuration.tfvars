global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
  }
  random_length = 5
}

resource_groups = {
  test = { #resource_group_key
    name = "test"
  }
}

keyvaults = {
  test_client = {
    name                = "testkv"
    resource_group_key  = "test"
    sku_name            = "standard"
    soft_delete_enabled = true
    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }
}

keyvault_access_policies_azuread_apps = {
  test_client = {
    test_client = {
      azuread_app_key    = "test_client"
      secret_permissions = ["Set", "Get", "List", "Delete"]
    }
  }
}

azuread_users = {
  user1 = {
    user_name    = "demo-user"
    keyvault_key = "test_client"
    department   = "demo-department"
    mobile       = "12345678"
    password_policy = {
      # Length of the password
      length  = 250
      special = false
      upper   = true
      number  = true

      # Define the number of days the password is valid. It must be more than the rotation frequency
      expire_in_days = 10
      rotation = {
        #
        # Set how often the password must be rotated. When passed the renewal time, running the terraform plan / apply will change to a new password
        # Only set one of the value
        #

        mins = 1 # only recommended for CI and demo
        # days = 7
        # months = 1
      }
    } //password_policy
  }
}