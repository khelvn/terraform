output "load_balancer_id" {
  description = "Load Balancer ID"
  value       = azurerm_lb.this.id
}

output "backend_pool_id" {
  description = "Backend address pool ID"
  value       = azurerm_lb_backend_address_pool.this.id
}

output "public_ip_id" {
  description = "Public IP resource ID"
  value       = azurerm_public_ip.this.id
}

output "public_ip_address" {
  description = "Public IP address of the Load Balancer"
  value       = azurerm_public_ip.this.ip_address
}

output "public_fqdn" {
  description = "Public FQDN of the Load Balancer if a DNS label is configured"
  value       = azurerm_public_ip.this.fqdn
}

output "ssh_frontend_port" {
  description = "Frontend port for SSH NAT rule"
  value       = var.ssh_frontend_port
}

output "ssh_nat_rule_id" {
  description = "SSH inbound NAT rule ID"
  value       = azurerm_lb_nat_rule.ssh.id
}