variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the Load Balancer"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Public IP for the Load Balancer"
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "Frontend IP configuration name"
  type        = string
  default     = "public-frontend"
}

variable "backend_pool_name" {
  description = "Backend address pool name"
  type        = string
  default     = "web-backend-pool"
}

variable "health_probe_name" {
  description = "Health probe name"
  type        = string
  default     = "http-probe"
}

variable "http_rule_name" {
  description = "HTTP load balancing rule name"
  type        = string
  default     = "http-rule"
}

variable "ssh_nat_rule_name" {
  description = "SSH inbound NAT rule name"
  type        = string
  default     = "ssh-nat-rule"
}

variable "ssh_frontend_port" {
  description = "Frontend port exposed for SSH via LB NAT rule"
  type        = number
  default     = 2222
}

variable "domain_name_label" {
  description = "Optional DNS label for the Load Balancer public IP"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to Load Balancer resources"
  type        = map(string)
  default     = {}
}