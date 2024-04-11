resource "aws_db_instance" "sinapsisVet_db" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"
  db_name                 = "vet_acpc"
  username             = "vet_acpc_user"
  password             =  var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sinapsisVet_sg_rds.id]
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "sinapsisvet_db_subnet_group"
  subnet_ids = [var.subnet_id, var.subnet_id2]
}

resource "aws_security_group" "sinapsisVet_sg_rds" {
  name        = "sinapsisVet_sg_rds"
  description = "Allows PostgreSQL traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups  = [var.bastion_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_rds"
  }
}