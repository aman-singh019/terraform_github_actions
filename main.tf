terraform {
  required_providers {
    azurerm={
      source = "hashicorp/azurerm"
      version = "2.64.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "backup-new"
    storage_account_name = "stgtest010101"
    container_name = "mycontainer"
    key = "terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {

  }
}

################# rg #####################
module "rg" {
  source                   = "./modules/resource_group"
  resource_group_variables = var.resource_group_variables
}

################### vnet #################

module "vnet" {
  source                    = "./modules/vnet"
  virtual_network_variables = var.virtual_network_variables
  depends_on = [
    module.rg
  ]
}
###########subnet#################

module "subnet" {
  source           = "./modules/subnet"
  subnet_variables = var.subnet_variables
  depends_on = [
    module.rg,
    module.vnet
  ]

}

################## nic #################
module "nic01" {
  source                      = "./modules/NIC"
  network_interface_variables = var.network_interface_variables
  depends_on = [
    module.rg,
    module.vnet,
    module.subnet
    #module.public_ip
  ]
}

############### VM ##################
 
 module "vm" {
    source = "./modules/virtual_machines"
    virtual_machine_variables = var.virtual_machine_variables
    depends_on = [
      module.rg,
      module.vnet, 
      module.subnet,
      module.nic01
      #module.public_ip
    ]
 }

 ############### public ip ##############

#  module "public_ip" {
#    source = "./modules/vm_public_ip"
#    public_ip_variables = var.public_ip_variables
#    depends_on = [ 
#     module.rg,
#     module.vnet
#     ]
#  }

