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
  value	      = module.vpc.private_subnets
}

#output "arn" {
#  description = "ARN of the bucket"
#  value       = module.s3.aws_s3_bucket.s3_bucket.arn
#}

#output "name" {
#  description = "Name (id) of the bucket"
#  value       = aws_s3_bucket.s3_bucket.id
#}

#output "website_endpoint" {
#  description = "Domain name of the bucket"
#  value       = "http://${aws_s3_bucket.bucket.website_endpoint}/index.html"
#}
