output "public_subnets" {
  value = module.vpc_creation.public_subnet_id
}

output "private_subnets" {
  value = module.vpc_creation.private_subnet_id
}