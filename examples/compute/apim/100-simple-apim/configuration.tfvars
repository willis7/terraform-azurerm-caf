resource_groups = {
  apim_region1 = {
    name   = "example-apim"
    region = "region1"
  }
}

api_managements = {
  apim1 = {
    publisher_name      = "My Company"
    publisher_email     = "company@terraform.io"

    resource_group_key = "apim_region1"
    name               = "apim-re1-001"
    vnet_key           = "vnet_region1"
    subnet_key         = "apim-subnet"
    sku_name           = "Developer_1"
  }
}