variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "web_subnet_name" {
  description = "Web subnet name"
  type        = string
}

variable "web_subnet_prefixes" {
  description = "Address prefixes for the web subnet"
  type        = list(string)
}

variable "nsg_name" {
  description = "Network security group name"
  type        = string
}

variable "admin_source_ip" {
  description = "Admin public IP in CIDR notation for SSH access"
  type        = string
}

variable "tags" {
  description = "Tags applied to network resources"
  type        = map(string)
  default     = {}
}