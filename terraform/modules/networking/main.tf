resource "aws_subnet" "public_subnet_1" {
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone_1
  cidr_block = var.cidr_subnet_1
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone_2
  cidr_block = var.cidr_subnet_2
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id
  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ig.id
  }
}

resource "aws_route_table_association" "subnet1_association" {
  subnet_id = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "subnet2_association" {
  subnet_id = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.rt.id
}
