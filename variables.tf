variable "location" {
  description = "Azure region"
  type        = string
  default     = "uksouth"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Workload name"
  type        = string
  default     = "web"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.20.0.0/16"]
}

variable "web_subnet_prefixes" {
  type    = list(string)
  default = ["10.20.1.0/24"]
}

variable "admin_username" {
  description = "Admin username for VM"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
}

variable "admin_source_ip" {
  description = "Public IP for SSH access"
  type        = string
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "instance_count" {
  description = "Number of VMs (for future scaling)"
  type        = number
  default     = 1
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default = {
    environment = "dev"
    project     = "nhs-web"
  }
}

variable "lb_domain_name_label" {
  description = "DNS label for the Load Balancer public IP"
  type        = string
  default     = null
}