variable "name" {
  type        = string
  description = "Name of the security group"
  default     = "diet-planner-mongodb-sg"
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
      to_port   = 27017
      from_port = 27017
      protocol  = "tcp"
    }
  ]
}

