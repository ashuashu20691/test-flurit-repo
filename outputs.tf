output "vpc_id" {
  value       = aws_vpc.main_vpc.id
  description = "The ID of the VPC."
}

output "public_subnet_ids" {
  value       = [aws_subnet.public_1.id, aws_subnet.public_2.id]
  description = "List of IDs of public subnets."
}

output "private_subnet_ids" {
  value       = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  description = "List of IDs of private subnets."
}

output "ecs_cluster_arn" {
  value       = aws_ecs_cluster.main_cluster.arn
  description = "The ARN of the ECS cluster."
}

output "ecs_service_name" {
  value       = aws_ecs_service.app_service.name
  description = "The name of the ECS service."
}

output "alb_dns_name" {
  value       = aws_lb.ecs_alb.dns_name
  description = "The DNS name of the load balancer."
}

output "api_gateway_endpoint" {
  value       = aws_apigatewayv2_api.http_api.api_endpoint
  description = "The endpoint of the HTTP API Gateway."
}

output "postgres_db_endpoint" {
  value       = aws_db_instance.postgres_db.endpoint
  description = "The connection endpoint for the PostgreSQL database."
}

output "oracle_db_endpoint" {
  value       = aws_db_instance.oracle_db.endpoint
  description = "The connection endpoint for the Oracle database."
}

output "redis_endpoint" {
  value       = aws_elasticache_cluster.redis_cluster.cache_nodes[0].address
  description = "The DNS name of the Redis cache node."
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.assets_bucket.id
  description = "The name of the assets S3 bucket."
}

output "cloudfront_domain_name" {
  value       = aws_cloudfront_distribution.cdn.domain_name
  description = "The domain name corresponding to the CloudFront distribution."
}
