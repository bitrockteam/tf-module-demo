provider "aws" {
  version                 = "~> 2.53"
  region                  = var.aws_region
  profile                 = var.aws_profile
  allowed_account_ids     = ["${var.aws_account_id}"]
}

terraform {
  required_version = "~> 0.12.23"
  backend "s3" {
    encrypt = true
  }
}

#Calling modules
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"

  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = var.vpc_azs
  private_subnets    = var.vpc_private_subnets
  public_subnets     = var.vpc_public_subnets
  enable_nat_gateway = var.vpc_enable_nat_gateway
  tags               = var.env_tags
}

#module "s3-static" {
#  source      = "../../modules/s3-static"
#  tags        = var.env_tags
#}

