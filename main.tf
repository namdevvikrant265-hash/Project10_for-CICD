
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.4.0"
    }
  }

 backend "azurerm" {
  storage_account_name = "backendstoragevik"
  container_name       = "backendcontainer"
  key                  = "prod.terraform.tfstate"

  use_azuread_auth = true
}
  }


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "frontend" {
  name     = "rg-frontend"
  location = "Central India"
}

resource "azurerm_virtual_network" "backendvnet" {
  name                = "back_vnet1"
  resource_group_name = azurerm_resource_group.frontend.name
  location            = azurerm_resource_group.frontend.location
  address_space       = ["10.0.0.0/16"]
}