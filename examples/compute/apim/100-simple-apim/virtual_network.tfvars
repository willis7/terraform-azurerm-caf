vnets = {
  vnet_region1 = {
    resource_group_key = "apim_region1"
    vnet = {
      name          = "apim_vnet"
      address_space = ["10.100.100.0/24"]
    }
    specialsubnets = {}
    subnets = {
      apim-subnet = {
        name    = "apim_subnet"
        cidr    = ["10.100.100.0/25"]
        nsg_key = "apim"
      }
    }
  }
}