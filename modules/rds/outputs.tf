output "db_instance_endpoint" {
  value       = module.rds.db_instance_endpoint
  description = "The connection endpoint"
}

output "db_instance_address" {
  value       = module.rds.db_instance_address
  description = "The address of the RDS instance"
}

output "db_instance_port" {
  value       = module.rds.db_instance_port
  description = "The database port"
}

