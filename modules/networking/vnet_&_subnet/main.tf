locals {
  naming_prefix = format("%s-%s-%s", var.naming_conventions.product_code, var.naming_conventions.loc_short_code, var.naming_conventions.environment)
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg_variables
  name     = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.rg_short_code, each.value["rg_ordinal"])
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.networks
  name                = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.vnet_short_code, each.value["vnet_ordinal"])
  location            = var.location
  resource_group_name = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.rg_short_code, each.value["rg_ordinal"])
  address_space       = each.value["address_space"]
  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet
  name                 = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.snet_short_code, each.value["subnet_ordinal"])
  virtual_network_name = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.vnet_short_code, each.value["rg_ordinal"]) ## yeh line rishabh se poochni hai 
  resource_group_name  = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.rg_short_code, each.value["vnet_ordinal"])
  address_prefixes     = each.value["address_prefix"]
  depends_on           = [azurerm_virtual_network.vnet]

}