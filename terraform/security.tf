# Grupo de seguridad

resource "azurerm_network_security_group" "lpsc_SecGroup" {
    name                = "sshtraffic"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "CP2"
    }
}

# hacemos la relacion con el grupo de seguridad y la interface de red
resource "azurerm_network_interface_security_group_association" "lpsc_SecGroupAssociation1" {
    network_interface_id      = azurerm_network_interface.lpsc_Nic1.id
    network_security_group_id = azurerm_network_security_group.lpsc_SecGroup.id
}
resource "azurerm_network_interface_security_group_association" "lpsc_SecGroupAssociation2" {
    network_interface_id      = azurerm_network_interface.lpsc_Nic2.id
    network_security_group_id = azurerm_network_security_group.lpsc_SecGroup.id
}