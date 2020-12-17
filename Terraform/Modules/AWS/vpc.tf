# Customized VPC creation with
resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.tenancy
  enable_dns_support   = var.dns_support
  enable_dns_hostnames = var.dns_hostnames
  enable_classiclink   = var.classiclink

  tags = {
    Name = "myvpc"
  }
}

# Public Subnets Creation
resource "aws_subnet" "Mypublic_subnets" {
  count                   = length(var.public_cidr_subnet)
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = element(var.public_cidr_subnet,count.index)
  map_public_ip_on_launch = var.public_ip_mapping
  availability_zone       = element(data.aws_availability_zones.azs.names,count.index)

  tags = {
    Name = "mypublic_subnet-${count.index+1}"
  }
}

# Private Subnet Creation
resource "aws_subnet" "Myprivate_subnets" {
  count      = length(var.private_cidr_subnet)
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = element(var.private_cidr_subnet,count.index)

  #By default map_public_ip_on_launch is false . Mentioned casually
  #map_public_ip_on_launch = "false"
  availability_zone = element(data.aws_availability_zones.azs.names,count.index)

  tags = {
    Name = "myprivate_subnet-${count.index+1}"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myigw"
  }
}

resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "myroutetable-public"
  }
}

resource "aws_route_table_association" "Mypublic_RTs" {
  count          = length(var.public_cidr_subnet)
  subnet_id      = element(aws_subnet.Mypublic_subnets.*.id,count.index)
  route_table_id = aws_route_table.myroutetable.id
}
