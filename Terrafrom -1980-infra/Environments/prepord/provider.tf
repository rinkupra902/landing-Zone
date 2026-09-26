terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ril-rg"
    storage_account_name = "rilstorage22092026"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

}


provider "azurerm" {
  features {}
}
