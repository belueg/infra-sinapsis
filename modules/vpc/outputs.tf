output "vpc_id" {
  value       = aws_vpc.sinapsisVet_vpc_rds.id
  description = "VPC ID"
}

output "subnet_id" {
  value       = aws_subnet.private_subnet_rds.id
  description = "Subnet ID"
  
}

output "subnet_id_2" {
  value       = aws_subnet.private_subnet_rds_2.id
  description = "Subnet ID 2"
  
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnet.id
  description = "Public subnet ID"
  
}