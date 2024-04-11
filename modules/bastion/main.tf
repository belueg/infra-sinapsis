
resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion_key_pair"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
}

resource "aws_ssm_parameter" "ssh_private_key" {
  name        = "/bastion/ssh_private_key"
  type        = "SecureString"
  value       = tls_private_key.ssh_key.private_key_pem
  description = "SSH Public Key for Bastion Host"
}

resource "aws_instance" "bastion_host" {
  ami           = "ami-0306897d7ae1fd43b"
  instance_type = "t3.micro"
  subnet_id     = var.public_subnet_id
  key_name      = aws_key_pair.bastion_key.key_name  
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "BastionHost"
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["181.231.213.244/32"] 
    description = "Home"
  }

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["190.229.17.12/32"] 
    description = "SUM"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion_sg"
  }
}

# resource "aws_eip" "bastion_eip" {
#   instance = aws_instance.bastion_host.id
#   domain   = "vpc" 

#   tags = {
#     Name = "BastionEIP"
#   }
# }
