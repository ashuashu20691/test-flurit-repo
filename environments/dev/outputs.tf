output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"
}

output "alb_dns_name" {
  value       = module.alb.dns_name
  description = "ALB DNS Name"
}

output "rds_endpoint" {
  value       = module.rds.db_instance_endpoint
  description = "RDS Endpoint"
}

output "mongodb_ip" {
  value       = module.mongodb.private_ip
  description = "MongoDB Private IP"
}

output "cloudfront_domain" {
  value       = module.cloudfront.cloudfront_distribution_domain_name
  description = "CloudFront Domain"
}

