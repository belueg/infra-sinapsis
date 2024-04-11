resource "aws_vpc" "sinapsisVet_vpc_rds" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "sinapsisVet_vpc_rds" 
}
}

resource "aws_subnet" "private_subnet_rds" {
  vpc_id            = aws_vpc.sinapsisVet_vpc_rds.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "private_subnet_rds"
  }
}

resource "aws_subnet" "private_subnet_rds_2" {
  vpc_id            = aws_vpc.sinapsisVet_vpc_rds.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "sa-east-1b"  

  tags = {
    Name = "private_subnet_rds_2"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.sinapsisVet_vpc_rds.id 
  cidr_block        = "10.0.3.0/24"  
  availability_zone = "sa-east-1a" 

  map_public_ip_on_launch = true  

  tags = {
    Name = "public_subnet_for_bastion"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.sinapsisVet_vpc_rds.id

  tags = {
    Name = "sinapsisVet_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.sinapsisVet_vpc_rds.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "sinapsisVet_public_rt"
  }
}

resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
