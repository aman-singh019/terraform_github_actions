data "azurerm_subnet" "subnet" {
  for_each             = var.network_interface_variables
  name                 = each.value["name_subnet"]
  resource_group_name  = each.value["resource_group_name"]
  virtual_network_name = each.value["virtual_network_name"]
}

# data "azurerm_public_ip" "public_ip" {
#   for_each = var.network_interface_variables
#   name = each.value["public_ip_name"]
#   resource_group_name = each.value["resource_group_name_ip"]
# }

resource "azurerm_network_interface" "network_interface" {
  for_each            = var.network_interface_variables
  name                = each.value["name_nic"]
  location            = each.value["location"]
  resource_group_name = each.value["resource_group_name"]

  ip_configuration {
    name                          = each.value["name_ip"]
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = data.azurerm_public_ip.public_ip[each.key].id
  }
}