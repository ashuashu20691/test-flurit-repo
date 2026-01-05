output "cluster_id" {
  value       = module.ecs.cluster_id
  description = "The ID of the ECS cluster"
}

output "cluster_name" {
  value       = module.ecs.cluster_name
  description = "The name of the ECS cluster"
}

