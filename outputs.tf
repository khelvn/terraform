output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.name
}

output "load_balancer_public_ip" {
  description = "Public IP address of the Load Balancer"
  value       = module.load_balancer.public_ip_address
}

output "load_balancer_public_fqdn" {
  description = "Public FQDN of the Load Balancer"
  value       = module.load_balancer.public_fqdn
}

output "website_url" {
  description = "Website URL"
  value       = module.load_balancer.public_fqdn != null ? "http://${module.load_balancer.public_fqdn}" : "http://${module.load_balancer.public_ip_address}"
}

output "ssh_command" {
  description = "SSH command to access the VM through the Load Balancer NAT rule"
  value       = "ssh -i ~/.ssh/id_rsa -p ${module.load_balancer.ssh_frontend_port} ${var.admin_username}@${module.load_balancer.public_ip_address}"
}

output "vm_private_ip_address" {
  description = "Private IP address of the VM"
  value       = module.linux_vm.private_ip_address
}