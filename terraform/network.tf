# Creacion de red
resource "azurerm_virtual_network" "lpsc_Net" {
    name                = "lpsc_kubernetesnet"
    address_space       = ["192.168.0.0/16"]
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
    virtual_network_name   = azurerm_virtual_network.lpsc_Net.name
    address_prefixes       = ["192.168.1.0/24"]

}

# Creacion del NIC 1 para la primera maquina

resource "azurerm_network_interface" "lpsc_Nic1" {
  name                = "vmnica_lpsc"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "lpsc_ipconfiguration1"
    subnet_id                      = azurerm_subnet.lpsc_Subnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "192.168.1.110"
    public_ip_address_id           = azurerm_public_ip.lpsc_PublicIp1.id
  }

    tags = {
        environment = "CP2"
    }

}

# Creacion del NIC 2 para la segunda maquina

resource "azurerm_network_interface" "lpsc_Nic2" {
  name                = "vmnicb_lpsc"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "lpsc_ipconfiguration1"
    subnet_id                      = azurerm_subnet.lpsc_Subnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "192.168.1.111"
    public_ip_address_id           = azurerm_public_ip.lpsc_PublicIp2.id
  }

    tags = {
        environment = "CP2"
    }

}

# Definicion de IP pública 1
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


# Definición de IP publica 2
resource "azurerm_public_ip" "lpsc_PublicIp2" {
  name                = "vmip2_lpsc"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}