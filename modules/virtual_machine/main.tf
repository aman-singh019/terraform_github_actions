locals {
  naming_prefix = format("%s-%s-%s", var.naming_conventions.product_code, var.naming_conventions.loc_short_code, var.naming_conventions.environment)
}

data "azurerm_subnet" "subnet" {
  for_each             = var.virtual_machine_variables
  name                 = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.snet_short_code, each.value["subnet_ordinal"])
  virtual_network_name = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.vnet_short_code, each.value["vnet_ordinal"]) ## yeh line rishabh se poochni hai 
  resource_group_name  = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.rg_short_code, each.value["rg_ordinal"])

}

resource "azurerm_network_interface" "network_interface" {
  for_each            = var.virtual_machine_variables
  name                = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.nic_short_code, each.value["nic_ordinal"])
  location            = var.location
  resource_group_name = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.rg_short_code, each.value["rg_ordinal"])

  ip_configuration {
    name                          = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.ip_config_short_code, each.value["ip_config_ordinal"])
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  for_each              = var.virtual_machine_variables
  name                  = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.vm_short_code, each.value["vm_ordinal"])
  location              = var.location
  resource_group_name   = format("%s-%s-%s", local.naming_prefix, var.naming_conventions.rg_short_code, each.value["rg_ordinal"])
  network_interface_ids = [azurerm_network_interface.network_interface[each.key].id]
  vm_size               = each.value["vm_size"]

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = each.value["publisher"]
    offer     = each.value["offer"]
    sku       = each.value["sku"]
    version   = each.value["version"]
  }
  storage_os_disk {
    name              = each.value["os_disk_name"]
    caching           = each.value["caching"]
    create_option     = each.value["create_option"]
    managed_disk_type = each.value["managed_disk_type"]
  }
  os_profile {
    computer_name  = each.value["compute_name"]
    admin_username = each.value["admin_username"]
    admin_password = each.value["admin_password"]
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}