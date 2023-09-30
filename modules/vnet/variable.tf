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