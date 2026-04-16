module "resource_group" {
  source = "./modules/resource_group"

  name     = local.resource_names.rg
  location = var.location
  tags     = local.common_tags
}

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  vnet_name           = local.resource_names.vnet
  vnet_address_space  = var.vnet_address_space
  web_subnet_name     = local.resource_names.web_subnet
  web_subnet_prefixes = var.web_subnet_prefixes
  nsg_name            = local.resource_names.nsg
  admin_source_ip     = var.admin_source_ip
  tags                = local.common_tags
}

module "nat_gateway" {
  source = "./modules/nat_gateway"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  nat_gateway_name    = local.resource_names.nat
  public_ip_name      = local.resource_names.nat_pip
  subnet_id           = module.network.web_subnet_id
  tags                = local.common_tags
}

module "load_balancer" {
  source = "./modules/load_balancer"

  resource_group_name            = module.resource_group.name
  location                       = module.resource_group.location
  load_balancer_name             = local.resource_names.lb
  public_ip_name                 = local.resource_names.lb_pip
  frontend_ip_configuration_name = "public-frontend"
  backend_pool_name              = "web-backend-pool"
  health_probe_name              = "http-probe"
  http_rule_name                 = "http-rule"
  ssh_nat_rule_name              = "ssh-nat-rule"
  ssh_frontend_port              = 2222
  domain_name_label              = var.lb_domain_name_label
  tags                           = local.common_tags
}

module "linux_vm" {
  source = "./modules/linux_vm"

  resource_group_name     = module.resource_group.name
  location                = module.resource_group.location
  vm_name                 = local.resource_names.vm
  computer_name           = "webvm01"
  nic_name                = local.resource_names.nic
  os_disk_name            = "${local.resource_names.vm}-osdisk"
  subnet_id               = module.network.web_subnet_id
  backend_address_pool_id = module.load_balancer.backend_pool_id
  nat_rule_id             = module.load_balancer.ssh_nat_rule_id
  admin_username          = var.admin_username
  ssh_public_key_path     = var.ssh_public_key_path
  vm_size                 = var.vm_size
  custom_data_file        = "${path.module}/cloud-init/ubuntu-web.yaml"
  tags                    = local.common_tags

  depends_on = [
    module.nat_gateway,
    module.load_balancer
  ]
}