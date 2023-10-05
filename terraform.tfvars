naming_conventions = {
  rg_short_code        = "rg"
  rg_ordinal           = "01"
  vnet_short_code      = "vnet"
  snet_short_code      = "snet"
  nic_short_code       = "nic"
  ip_config_short_code = "ip_config"
  vm_short_code        = "vm"
  environment          = "dev"
  loc_short_code       = "eus"
  product_code         = "hub"
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
  }
  # "s2" = {
  #   subnet_ordinal = "02"
  #   address_prefix = ["10.0.2.0/24"]
  #   vnet_ordinal   = "01"
  #   rg_ordinal     = "01"
  # }

}

# network_interface_variables = {
#   "nic01" = {
#     nic_ordinal       = "01"
#     rg_ordinal        = "01"
#     ip_config_ordinal = "01"
#     subnet_ordinal="01"
#     vnet_ordinal="01"
#   }
# }

virtual_machine_variables = {
  "vm-01" = {
    vm_ordinal = "01"
    rg_ordinal = "01"
    vm_size    = "Standard_DS1_v2"

    nic_ordinal       = "01"
    ip_config_ordinal = "01"
    subnet_ordinal    = "01"
    vnet_ordinal      = "01"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"

    os_disk_name      = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

    compute_name   = "vm001"
    admin_username = "aksingh"
    admin_password = "123@azure123@AZURE"

  }
}



