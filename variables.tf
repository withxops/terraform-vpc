variable "env" {}
variable "az" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}