variable "name" {
  type        = string
  description = "Name of the security group"
  default     = "diet-planner-ecs-sg"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "egress_with_cidr_blocks" {
  type        = list(map(string))
  description = "Egress rules"
  default = [
    {
      cidr_blocks = "0.0.0.0/0"
      to_port     = 0
      protocol    = "-1"
      from_port   = 0
    }
  ]
}

