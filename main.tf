provider "aws" {
  region = var.region
}

module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "nat_gateway" {
  source           = "./modules/nat_gateway"
  public_subnet_id = module.vpc.public_subnet_id
}

module "route_tables" {
  source            = "./modules/route_tables"
  vpc_id            = module.vpc.vpc_id
  internet_gateway_id = module.vpc.internet_gateway_id
  nat_gateway_id    = module.nat_gateway.nat_gateway_id
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
}

module "security_groups" {
  source         = "./modules/security_groups"
  vpc_id         = module.vpc.vpc_id
  ssh_cidr_block = "0.0.0.0/0"
}

module "ec2" {
  source           = "./modules/ec2"
  ami              = "ami-0fff1b9a61dec8a5f"
  instance_type    = var.instance_type
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  public_sg_id     = module.security_groups.public_sg_id
  private_sg_id    = module.security_groups.private_sg_id
}
