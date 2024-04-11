variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "subnet_id2" {
  description = "The ID of the subnet"
  type        = string
}

variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "bastion_sg_id" {
  description = "The id of the bastion security group"
  type        = string
}