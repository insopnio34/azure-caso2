# Creación de red
resource "azurerm_virtual_network" "lpsc_Net" {
    name                = "lpsc_kubernetesnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    tags = {
        environment = "CP2"
    }
}

# Creación de subnet
resource "azurerm_subnet" "lpsc_Subnet" {
    name                   = "lpsc_terraformsubnet"
    resource_group_name    = azurerm_resource_group.rg.name
    virtual_network_name   = azurerm_virtual_network.myNet.name
    address_prefixes       = ["10.0.1.0/24"]

}

# Creación del NIC

resource "azurerm_network_interface" "lpsc_Nic1" {
  name                = "vmnic1_lpsc"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "lpsc_ipconfiguration1"
    subnet_id                      = azurerm_subnet.mySubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.10"
    public_ip_address_id           = azurerm_public_ip.lpsc_PublicIp1.id
  }

    tags = {
        environment = "CP2"
    }

}

# Definición de IP pública
resource "azurerm_public_ip" "lpsc_PublicIp1" {
  name                = "vmip1_lpsc"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}