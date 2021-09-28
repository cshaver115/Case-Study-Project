module "networking" {
  source = "../../modules/networking/"

  vpc_cidr        = var.vpc_cidr
  tags            = var.tags
  subnet_settings = var.subnet_settings
}
