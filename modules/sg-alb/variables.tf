variable "name" {
  type        = string
  description = "Name of the security group"
  default     = "diet-planner-alb-sg"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "ingress_with_cidr_blocks" {
  type        = list(map(string))
  description = "Ingress rules"
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      cidr_blocks = "0.0.0.0/0"
      to_port     = 443
      from_port   = 443
      protocol    = "tcp"
    }
  ]
}

variable "egress_with_cidr_blocks" {
  type        = list(map(string))
  description = "Egress rules"
  default = [
    {
      to_port     = 0
      from_port   = 0
      cidr_blocks = "0.0.0.0/0"
      protocol    = "-1"
    }
  ]
}

