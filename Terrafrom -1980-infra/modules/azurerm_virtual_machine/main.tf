resource "azurerm_network_interface" "nics" {
  for_each            = var.virtual_machine
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.snets[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vms" {
  for_each            = var.virtual_machine
  name                = each.value.vm_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id
  ]

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  size           = each.value.vm_size

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
