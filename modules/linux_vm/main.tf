resource "azurerm_network_interface" "this" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "this" {
  network_interface_id    = azurerm_network_interface.this.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = var.backend_address_pool_id
}

resource "azurerm_network_interface_nat_rule_association" "this" {
  network_interface_id  = azurerm_network_interface.this.id
  ip_configuration_name = "internal"
  nat_rule_id           = var.nat_rule_id
}

resource "azurerm_linux_virtual_machine" "this" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = var.admin_username
  tags                = var.tags

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  disable_password_authentication = true
  custom_data                     = base64encode(file(var.custom_data_file))

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = var.os_disk_name
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name = var.computer_name

  depends_on = [
    azurerm_network_interface_backend_address_pool_association.this,
    azurerm_network_interface_nat_rule_association.this
  ]
}