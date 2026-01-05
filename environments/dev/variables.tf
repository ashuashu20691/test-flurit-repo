variable "region" {
  type        = string
  description = "AWS region for resource deployment (e.g., us-east-1, eu-west-1)"
  default     = "us-east-1"
  sensitive   = false
}

variable "project_name" {
  type        = string
  description = "Project name prefix"
  default     = "diet-planner"
}

variable "db_username" {
  type        = string
  description = "Database username"
  default     = "admin"
}

