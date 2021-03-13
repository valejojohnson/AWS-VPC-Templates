#----------------------------------- Pull All AZ's for Region -----------------------------------#

data "aws_availability_zones" "available" {}

#--------------------------------------------- VPC ----------------------------------------------#

resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_cidr
  assign_generated_ipv6_cidr_block = false
  instance_tenancy                 = "default"
  enable_dns_hostnames             = true
  enable_dns_support               = true

  tags = {
    Name = terraform.workspace
  }
}

#----------------------------------- Internet Gateway -------------------------------------------#

resource "aws_internet_gateway" "ig" {
  depends_on = [aws_vpc.vpc]

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${terraform.workspace}-igw"
  }
}

#------------------------------------------ Subnets ---------------------------------------------#

resource "aws_subnet" "public_subnet" {
  depends_on = [aws_vpc.vpc, aws_subnet.private_subnet]

  count  = length(data.aws_availability_zones.available.names)
  vpc_id = aws_vpc.vpc.id
  #cidr_block = substr(var.vpc_cidr, 1, 11) + var.public_cidr[count.index]
  cidr_block              = element(var.public_cidr, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${terraform.workspace}-pub-${substr(data.aws_availability_zones.available.names[count.index], 9, 10)}"
  }
}

resource "aws_subnet" "private_subnet" {
  depends_on = [aws_vpc.vpc]

  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.private_cidr, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${terraform.workspace} priv-${substr(data.aws_availability_zones.available.names[count.index], 9, 10)}"
  }
}

#----------------------------------- Routing tables ---------------------------------------------#

resource "aws_route_table" "public" {
  depends_on = [aws_subnet.public_subnet]

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "rtb-${terraform.workspace}-pub"
  }
}

resource "aws_route_table_association" "route" {
  depends_on = [aws_route_table.public]

  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  depends_on = [aws_subnet.private_subnet]
  count      = length(data.aws_availability_zones.available.names)

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.nat-gw.*.id, count.index)
  }

  tags = {
    Name = "rtb-${terraform.workspace}-priv-${substr(data.aws_availability_zones.available.names[count.index], 9, 10)}"
  }
}

resource "aws_route_table_association" "private_route" {
  depends_on = [aws_route_table.private]

  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

#---------------------------------------- Elastic IP's ------------------------------------------#

resource "aws_eip" "nat" {
  depends_on = [aws_vpc.vpc]

  vpc   = true
  count = length(data.aws_availability_zones.available.names)

  tags = {
    Name = "eip-${terraform.workspace}-${substr(data.aws_availability_zones.available.names[count.index], 9, 10)}"
  }
}

#--------------------------------------- Nat GW's ----------------------------------------------#

resource "aws_nat_gateway" "nat-gw" {
  depends_on = [aws_internet_gateway.ig, aws_eip.nat]

  count         = length(data.aws_availability_zones.available.names)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(aws_subnet.public_subnet.*.id, count.index)
  tags = {
    Name = "${terraform.workspace}-nat-${substr(data.aws_availability_zones.available.names[count.index], 9, 10)}"
  }
}
