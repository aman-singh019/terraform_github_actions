terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.64.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backup-new"
    storage_account_name = "stgtest010101"
    container_name       = "mycontainer"
    key                  = "terraform.tfstate"

  }
}

provider "azurerm" {
  features {

  }
}


module "vnet_subnet" {
  source             = "./modules/networking/vnet_&_subnet"
  networks           = var.networks
  subnet             = var.subnet
  location           = var.location
  rg_variables       = var.rg_variables
  naming_conventions = var.naming_conventions


}

