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
