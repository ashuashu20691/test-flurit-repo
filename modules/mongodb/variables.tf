variable "name" {
  type        = string
  description = "Name of the instance"
  default     = "diet-planner-mongodb"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t3.medium"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security Group IDs"
}

variable "user_data" {
  type        = string
  description = "User data script to install MongoDB"
}

