terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name = "rg-terraform-state"
    storage_account_name = "saterraformstate007" 
    container_name       = "tfstate"
    key                  =  "preprod.terraform.tfstate"
}
}
provider "azurerm" {
  features {}
}
