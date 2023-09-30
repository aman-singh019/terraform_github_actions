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