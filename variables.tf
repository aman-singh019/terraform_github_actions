variable "naming_conventions" {
  type = map(string)

}
variable "rg_variables" {
  type = map(object({
    rg_ordinal = string
  }))

}

variable "networks" {
  type = map(object({
    address_space = list(string)
    rg_ordinal    = string
    vnet_ordinal  = string

  }))
  default = {

  }
}

variable "subnet" {
  type = map(object({
    subnet_ordinal = string
    address_prefix = list(string)
    vnet_ordinal   = string
    rg_ordinal     = string
  }))
}

variable "location" {
  type = string
}


# variable "network_interface_variables" {
#   type = map(object({
#     nic_ordinal       = string
#     rg_ordinal        = string
#     ip_config_ordinal = string
#     subnet_ordinal=string
#     vnet_ordinal=string


#   }))
# }

variable "virtual_machine_variables" {
  type = map(object({

    vm_ordinal = string
    rg_ordinal = string
    vm_size    = string

    nic_ordinal       = string
    ip_config_ordinal = string
    subnet_ordinal    = string
    vnet_ordinal      = string

    publisher = string
    offer     = string
    sku       = string
    version   = string

    os_disk_name      = string
    caching           = string
    create_option     = string
    managed_disk_type = string

    compute_name   = string
    admin_username = string
    admin_password = string

  }))

}
# variable "resource_group_name" {
#   type = string

# }
# variable "subnet_id" {

# }
