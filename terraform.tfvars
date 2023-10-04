naming_conventions = {
  rg_short_code   = "rg"
  rg_ordinal      = "01"
  vnet_short_code = "vnet"
  snet_short_code = "snet"
  environment     = "dev"
  loc_short_code  = "eus"
  product_code    = "hub"
}
##########resource_group######
rg_variables = {
  "rg-01" = {
    rg_ordinal = "01"
  }
}
location = "eastus"


#############vnet#############

networks = {
  "my-vnet01" = {
    address_space = ["10.0.0.0/16"]
    vnet_ordinal  = "01"
    rg_ordinal    = "01"
  }
}
############subnet###################
subnet = {
  "s1" = {
    subnet_ordinal = "01"
    address_prefix = ["10.0.1.0/24"]
    vnet_ordinal   = "01"
    rg_ordinal     = "01"
  },
  "s2" = {
    subnet_ordinal = "02"
    address_prefix = ["10.0.2.0/24"]
    vnet_ordinal   = "01"
    rg_ordinal     = "01"
  }

}



