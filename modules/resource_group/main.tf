resource "azurerm_resource_group" "resource_group" {
  for_each = var.resource_group_variables
  name     = each.value["name"]
  location = each.value["location"]
}