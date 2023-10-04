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

# variable "resource_group_name" {
#   type = string

# }
