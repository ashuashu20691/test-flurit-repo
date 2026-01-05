output "id" {
  value       = module.mongodb.id
  description = "The ID of the instance"
}

output "private_ip" {
  value       = module.mongodb.private_ip
  description = "The private IP address"
}

