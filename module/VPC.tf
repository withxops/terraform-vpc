resource "aws_vpc" "my-vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  tags = {
    Name = var.vpc_name
    Environment = var.env
  }
}

resource "aws_subnet" "public_sub" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.az[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-${var.env}-public-subnet${count.index + 1}"
  }
}

resource "aws_subnet" "private_sub" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = var.az[count.index]
  tags = {
    Name = "${var.vpc_name}-${var.env}-private-subnet${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "${var.vpc_name}-${var.env}-igw"
  }
}

resource "aws_default_route_table" "public_route" {
  default_route_table_id = aws_vpc.my-vpc.default_route_table_id
  tags = {
    Name = "${var.vpc_name}-${var.env}-public-rt"
  }
}

resource "aws_route" "public_internet" {
  route_table_id = aws_default_route_table.public_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_association" {
  count = length(var.public_subnets)
  subnet_id = aws_subnet.public_sub[count.index].id
  route_table_id = aws_default_route_table.public_route.id
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "${var.vpc_name}-${var.env}-private-rt"
  }
}

resource "aws_route_table_association" "private_association" {
  count = length(var.private_subnets)
  subnet_id = aws_subnet.private_sub[count.index].id
  route_table_id = aws_route_table.private_route.id
}

