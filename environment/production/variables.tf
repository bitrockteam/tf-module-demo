# Input variable definitions
variable "allowed_account_ids" {
  description = "List of allowed AWS account ids where resources can be created"
  type        = list(string)
  default     = []
}

variable "aws_account_id" {
  type        = string
  description = "Your AWS account ID"
}

variable "aws_profile" {
  type        = string
  description = "Your AWS profile"
}

variable "aws_prefix" {
  type	      = string
  description  = "Environment / workspace , development, testing, production"
}

variable "aws_region" {
  type        = string
  description = "Your AWS region"
  default     = "us-west-1"
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "production-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.60.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list
  default     = ["us-west-1b", "us-west-1c"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.60.1.0/24", "10.60.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.60.101.0/24", "10.60.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "env_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "production"
  }
}

