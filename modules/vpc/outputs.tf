output "vpc_id" {
  value       = aws_vpc.sinapsisVet_vpc_rds.id
  description = "VPC ID"
}

output "subnet_id" {
  value       = aws_subnet.sinapsisVet_subnet_rds.id
  description = "Subnet ID"
  
}