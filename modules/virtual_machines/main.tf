data "azurerm_network_interface" "network_interface" {
  for_each            = var.virtual_machine_variables
  name                = each.value["name_nic"]
  resource_group_name = each.value["resource_group_name_nic"]
}

resource "azurerm_virtual_machine" "virtual_machine" {
  for_each              = var.virtual_machine_variables
 name                  = each.value["name_vm"]
  location              = each.value["location"]
  resource_group_name   = each.value["resource_group_name"]
  network_interface_ids  = [data.azurerm_network_interface.network_interface[each.key].id]
  vm_size               = each.value["vm_size"]

  storage_image_reference {
    publisher = each.value["publisher"]
    offer     = each.value["offer"]
    sku       = each.value["sku"]
    version   = each.value["version"]
  }
  os_profile {
    computer_name = each.value["computer_name"]
    admin_username = each.value["admin_username"]
    admin_password = each.value["admin_password"]
  }
  os_profile_windows_config {
    provision_vm_agent = true
  }
  storage_os_disk {
    name              = each.value["name_os_disk"]
    caching           = each.value["caching"]
    create_option     = each.value["create_option"]
    managed_disk_type = each.value["managed_disk_type"]
  }
}