variable "home" {
  type        = string
  description = "Your home directory"
}

variable "aws_account_id" {
  type        = string
  description = "Your AWS account ID"
}
variable "aws_region" {
  type        = string
  description = "Your AWS region"
}

variable "vpc_cidr" {
  type        = string
  description = "Your VPC CIDR"
}

variable "azs" {
  type        = list
  description = "Your AWS AZ"
}

variable "private_subnets" {
  type        = list
  description = "Your private subnet"
}

variable "public_subnets" {
  type        = list
  description = "Your public subnet"
}

