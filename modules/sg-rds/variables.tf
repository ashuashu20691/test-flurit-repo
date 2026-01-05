variable "name" {
  type        = string
  description = "Name of the security group"
  default     = "diet-planner-rds-sg"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "ingress_with_source_security_group_id" {
  type        = list(map(string))
  description = "Ingress rules from ECS"
  default = [
    {
      protocol  = "tcp"
      from_port = 1433
      to_port   = 1433
    }
  ]
}

