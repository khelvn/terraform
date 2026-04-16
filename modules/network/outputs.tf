output "vnet_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.this.name
}

output "web_subnet_id" {
  description = "Web subnet ID"
  value       = azurerm_subnet.web.id
}

output "web_subnet_name" {
  description = "Web subnet name"
  value       = azurerm_subnet.web.name
}

output "nsg_id" {
  description = "Network security group ID"
  value       = azurerm_network_security_group.this.id
}

output "nsg_name" {
  description = "Network security group name"
  value       = azurerm_network_security_group.this.name
}