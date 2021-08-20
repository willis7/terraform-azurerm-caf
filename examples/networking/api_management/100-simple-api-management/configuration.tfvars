global_settings = {
  default_region = "region1"
  regions = {
    region1 = "uksouth"
  }
}

resource_groups = {
  apim_region1 = {
    name   = "apim test"
    region = "region1"
  }
}

api_managements = {
  apim1 = {
    name               = "example-apimgmt"
    region             = "region1"
    resource_group_key = "apim_region1"
    publisher_name     = "My Company"
    publisher_email    = "company@terraform.io"
    sku_name           = "Developer_1"
    tags = {
      test = "apim_region1"
    }
  }
}