output "security_group_id" {
  value       = module.sg-ecs.security_group_id
  description = "The ID of the security group"
}

