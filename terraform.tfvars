resource_group_variables = {
  "rg01" = {
    location = "eastus"
    name     = "aman_rg_primary"
  }
  
}

#############vnet#############

virtual_network_variables = {
  "my-vnet01" = {
    address_space       = ["10.6.0.0/16"]
    location            = "eastus"
    name                = "HUB_eus_vnet"
    resource_group_name = "aman_rg_primary"
  }
  
}
################## subnet ###################

subnet_variables = {
  "subnet01" = {
    address_prefixes     = ["10.6.1.0/24"]
    name                 = "subnet01"
    resource_group_name  = "aman_rg_primary"
    virtual_network_name = "HUB_eus_vnet"
  }

}

############ nic ###############

network_interface_variables = {
  "nic01" = {
    location             = "eastus"
    name_ip              = "nic01_ip"
    name_nic             = "vm_nic01"
    name_subnet          = "subnet01"
    resource_group_name  = "aman_rg_primary"
    virtual_network_name = "HUB_eus_vnet"
    public_ip_name        = "pip01"
    resource_group_name_ip = "aman_rg_primary"
  }

}

############### VM #################

virtual_machine_variables = {
  "vm01" = {
    admin_password = "aman@#123"
    admin_username = "aman"
    caching = "ReadWrite"
    computer_name="vmone"
    create_option = "FromImage"
    location = "eastus"
    managed_disk_type = "Standard_LRS"
    name_nic = "vm_nic01"
    name_os_disk = "myosdisk1"
    name_vm = "AD_VM"
    offer = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    resource_group_name = "aman_rg_primary"
    resource_group_name_nic="aman_rg_primary"
    sku = "2019-Datacenter"
    version = "latest"
    vm_size = "Standard_E2s_v3"
  }

  
}

################# public ip ###################
 
#  public_ip_variables = {
#    "pip01" = {
#      name="pip01"
#      location="eastus"
#      resource_group_name="aman_rg_primary"
#         }
#  }

