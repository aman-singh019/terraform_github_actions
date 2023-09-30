resource "azurerm_virtual_network" "virtual_network" {
  for_each            = var.virtual_network_variables
  name                = each.value["name"]
  location            = each.value["location"]
  resource_group_name = each.value["resource_group_name"]
  address_space       = each.value["address_space"]
}