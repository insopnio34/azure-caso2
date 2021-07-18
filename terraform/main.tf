# regitramos el terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

# recurso de azure que utilizaremos
resource "azurerm_resource_group" "rg" {
    name     =  var.grupo_recursos
    location = var.localizacion
    tags = {
        environment = "CP2"
    }

}

# Cuenta de almacenamiento
resource "azurerm_storage_account" "stAc" {
    name                     = var.storage_account
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "CP2"
    }

}



