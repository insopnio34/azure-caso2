# regitramos el terraform

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

# Datos para autenticarnos en el sistema de Azure
provider "azurerm" {
  features {}
  subscription_id = credentials.subscription_id
  client_id = credentials.client_id # appID
  client_secret = credentials.client_secret # password
  tenant_id = credentials.tenant_id # tenant
}

# recurso de azure que utilizaremos

resource "azurerm_resource_group" "rg" {
    name     =  "lpsc-grupo"
    location = var.localizacion
    tags = {
        environment = "CP2"
    }

}

# Cuenta de almacenamiento
resource "azurerm_storage_account" "stAccount" {
    name                     = var.storage_account
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "CP2"
    }

}