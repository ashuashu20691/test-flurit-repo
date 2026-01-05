output "security_group_id" {
  value       = module.sg-alb.security_group_id
  description = "The ID of the security group"
}

