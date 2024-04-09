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

