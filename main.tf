module "vpc_creation" {
  source = "./module"
  cidr_block = var.vpc_cidr
  vpc_name = var.vpc_name
  env = var.env
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  az = var.az
}