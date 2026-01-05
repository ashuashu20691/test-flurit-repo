variable "identifier" {
  type        = string
  description = "Identifier"
  default     = "diet-planner-db"
}

variable "engine" {
  type        = string
  description = "Database engine"
  default     = "sqlserver-web"
}

variable "engine_version" {
  type        = string
  description = "Engine version"
  default     = "15.00.4043.16.v1"
}

variable "instance_class" {
  type        = string
  description = "Instance class"
  default     = "db.t3.medium"
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage (GB)"
  default     = 20
}

variable "username" {
  type        = string
  description = "Master username"
  default     = "admin"
}

variable "port" {
  type        = number
  description = "Database port"
  default     = 1433
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security Group IDs"
}

variable "family" {
  type        = string
  description = "Parameter group family"
  default     = "sqlserver-web-15.0"
}

variable "major_engine_version" {
  type        = string
  description = "Major engine version"
  default     = "15.00"
}

