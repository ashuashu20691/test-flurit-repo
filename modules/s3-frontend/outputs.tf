output "s3_bucket_bucket_regional_domain_name" {
  value       = module.s3-frontend.s3_bucket_bucket_regional_domain_name
  description = "The bucket region-specific domain name"
}

output "s3_bucket_arn" {
  value       = module.s3-frontend.s3_bucket_arn
  description = "The ARN of the bucket"
}

