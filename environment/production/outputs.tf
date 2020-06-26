# Output variable definitions

output "vpc_name" {
  description = "Name of the VPC"
  value       = module.vpc.name
}

output "vpc_azs" {
  description = "AZS created in the VPC"
  value       = module.vpc.azs
}

output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "vpc_priv_subnets" {
  description = "IDs pf the VPC's private subntes"
  value= module.vpc.private_subnets
}

