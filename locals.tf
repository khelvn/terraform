locals {
  prefix = "nhs-${var.environment}-uks-${var.project_name}"

  resource_names = {
    rg         = "${local.prefix}-rg"
    vnet       = "${local.prefix}-vnet"
    web_subnet = "${local.prefix}-web-subnet"
    nsg        = "${local.prefix}-nsg"
    lb         = "${local.prefix}-lb"
    lb_pip     = "${local.prefix}-lb-pip"
    nat        = "${local.prefix}-nat"
    nat_pip    = "${local.prefix}-nat-pip"
    vm         = "${local.prefix}-vm01"
    nic        = "${local.prefix}-nic01"
  }

  common_tags = merge(
    {
      environment = var.environment
      project     = "nhs-web"
      managed_by  = "terraform"
    },
    var.tags
  )
}