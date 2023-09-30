#################  RG  ################
variable "resource_group_variables" {
  type = map(object({
    name     = string
    location = string
  }))
}
################  vnet  ###################

variable "virtual_network_variables" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
  default = {
  }
}
################ NIC  ###############

variable "network_interface_variables" {
  type = map(object({
    name_subnet          = string
    resource_group_name  = string
    virtual_network_name = string
    
    public_ip_name=string
    resource_group_name_ip=string

    name_nic            = string
    location            = string
    resource_group_name = string

    name_ip = string
  }))
} 

###################################

variable "subnet_variables" {

  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  default = {

  }
}

################ VM #################

variable "virtual_machine_variables" {
  type = map(object({
    name_nic              = string
    resource_group_name=string
    resource_group_name_nic = string
    name_vm             = string
    location            = string
    vm_size             = string
   
    publisher = string
    offer     = string
    sku       = string
    version   = string

    computer_name=string
    admin_username = string
    admin_password = string

    name_os_disk      = string
    caching           = string
    create_option     = string
    managed_disk_type = string

  }))
}

# ################## public ip #################

# variable "public_ip_variables" {
#     type = map(object({
#       name = string
#       location=string
#       resource_group_name=string
#     }))
# }

