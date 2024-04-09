variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = list(string)
}

variable "db_password" {
  description = "The password for the database"
  type        = string
}