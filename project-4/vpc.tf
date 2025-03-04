resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet3
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-3"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id = aws_subnet.subnet2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id = aws_subnet.subnet3.id
  route_table_id = aws_route_table.public-rt.id
}