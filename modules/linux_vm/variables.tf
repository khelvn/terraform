variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "computer_name" {
  description = "Computer name for the VM"
  type        = string
}

variable "nic_name" {
  description = "Network interface name"
  type        = string
}

variable "os_disk_name" {
  description = "OS disk name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the NIC"
  type        = string
}

variable "backend_address_pool_id" {
  description = "Load Balancer backend pool ID"
  type        = string
}

variable "nat_rule_id" {
  description = "Load Balancer inbound NAT rule ID for SSH"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
}

variable "custom_data_file" {
  description = "Path to cloud-init file"
  type        = string
}

variable "tags" {
  description = "Tags applied to VM resources"
  type        = map(string)
  default     = {}
}