variable "project_name" {
  type        = string
  description = "The name of the project used for resource naming and tagging."
  default     = "my-app"
}

variable "environment" {
  type        = string
  description = "The deployment environment (e.g., dev, staging, prod)."
  default     = "dev"
}

variable "region" {
  type        = string
  description = "The AWS region where resources will be deployed."
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR block for the first public subnet."
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR block for the second public subnet."
  default     = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  type        = string
  description = "CIDR block for the first private subnet."
  default     = "10.0.10.0/24"
}

variable "private_subnet_2_cidr" {
  type        = string
  description = "CIDR block for the second private subnet."
  default     = "10.0.11.0/24"
}

variable "az_1" {
  type        = string
  description = "The first availability zone to use."
  default     = "us-east-1a"
}

variable "az_2" {
  type        = string
  description = "The second availability zone to use."
  default     = "us-east-1b"
}

variable "ecs_cluster_name" {
  type        = string
  description = "The name of the ECS cluster."
  default     = "app-cluster"
}

variable "ecs_service_desired_count" {
  type        = number
  description = "The desired number of instances for the ECS service."
  default     = 2
}

variable "task_cpu" {
  type        = number
  description = "The number of CPU units used by the task."
  default     = 256
}

variable "task_memory" {
  type        = number
  description = "The amount of memory (in MiB) used by the task."
  default     = 512
}

variable "container_image" {
  type        = string
  description = "The Docker image to use for the container."
  default     = "nginx:latest"
}

variable "container_port" {
  type        = number
  description = "The port the container listens on."
  default     = 80
}

variable "log_retention_days" {
  type        = number
  description = "The number of days to retain CloudWatch logs."
  default     = 30
}

variable "assets_bucket_name" {
  type        = string
  description = "The name of the S3 bucket for static assets."
  default     = "my-app-assets-unique-id"
}

variable "api_gateway_access_log_group_arn" {
  type        = string
  description = "The ARN of the CloudWatch Log Group for API Gateway access logs."
}

variable "db_instance_class" {
  type        = string
  description = "The instance type of the PostgreSQL RDS instance."
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  type        = number
  description = "The allocated storage in gigabytes for the PostgreSQL RDS instance."
  default     = 20
}

variable "db_name" {
  type        = string
  description = "The name of the database to create when the PostgreSQL RDS instance is created."
  default     = "myappdb"
}

variable "db_username" {
  type        = string
  description = "Username for the master DB user."
  default     = "dbadmin"
}

variable "oracle_instance_class" {
  type        = string
  description = "The instance type of the Oracle RDS instance."
  default     = "db.t3.medium"
}

variable "redis_node_type" {
  type        = string
  description = "The compute and memory capacity of the nodes in the Redis cluster."
  default     = "cache.t3.micro"
}
