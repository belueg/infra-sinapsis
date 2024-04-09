module "rds" {
    source = "./modules/rds"
    vpc_id = module.vpc.vpc_id
    subnet_id   = [module.vpc.subnet_id]
}

module "vpc" {
    source = "./modules/vpc"
}

module "bastion" {
    source = "./modules/bastion"
}