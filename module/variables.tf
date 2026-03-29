variable "cidr_block" {
  description = "This is the CIDR block for the VPC"
  type = string
}

variable "vpc_name" {
  description = "This will be VPC name"
  type = string
}

variable "instance_tenancy" {
  description = "instance_tenancy"
  default = "default"
  type = string
}
variable "env" {
  description = "This is the environment"
  type = string
}


variable "public_subnets" {
  description = "This is the public subnet range"
  type = string
}

variable "private_subnets" {
  description = "This is the private subnet range"
  type = string
}

variable "az" {
  description = "Availability Zone"
  type        = string
}