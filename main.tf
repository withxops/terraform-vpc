module "vpc_creation" {
  source = "./module"
  cidr_block = "10.0.0.0/16"
  vpc_name = "RHCE"
  env = "dev"
  public_subnets = "10.0.1.0/24"
  private_subnets = "10.0.2.0/24"
  az = "ap-south-1a"
}