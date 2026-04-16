variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "nat_gateway_name" {
  description = "Name of the NAT Gateway"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the public IP used by the NAT Gateway"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to associate with the NAT Gateway"
  type        = string
}

variable "tags" {
  description = "Tags applied to NAT Gateway resources"
  type        = map(string)
  default     = {}
}