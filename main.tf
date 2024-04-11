module "rds" {
  source        = "./modules/rds"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.subnet_id
  subnet_id2    = module.vpc.subnet_id_2
  db_password   = var.db_password
  bastion_sg_id = module.bastion.sg_id
}

module "vpc" {
  source = "./modules/vpc"
}

module "bastion" {
  source           = "./modules/bastion"
  public_subnet_id = module.vpc.public_subnet_id
  vpc_id           = module.vpc.vpc_id
}


variable "db_password" {
  description = "The password for the database"
  type        = string
}