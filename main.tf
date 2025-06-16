terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
 }

  }
  required_version = ">= 1.10.0"
}




module "vpc" {
  source = "./modules/vpc"
  region = var.region
  vpc_cidr = var.vpc_cidr
  public_subnet = var.public_subnet
  availability_zone = var.availability_zone
  private_subnet = var.private_subnet
}

module "focal_board_instance" {
  source = "./modules/instances"
  instance_type = var.instance_type
  ami_id = var.ami_id
  public_subnet_ids = module.vpc.public_subnet_id
  security_groups_id_ec2 = module.vpc.security_group_instance
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id_details
  subnets = module.vpc.public_subnet_id
  security_groups_id_alb = module.vpc.security_group_alb
  focal_instance_id = module.focal_board_instance.instance_id
}