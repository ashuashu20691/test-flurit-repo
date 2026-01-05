variable "name" {
  type        = string
  description = "Name of the ALB"
  default     = "diet-planner-alb"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnets" {
  type        = list(string)
  description = "Subnets"
}

variable "security_groups" {
  type        = list(string)
  description = "Security Groups"
}

variable "listeners" {
  type        = any
  description = "Listeners"
  default = {
    http = {
      target_group_index = 0
      protocol           = "HTTP"
      port               = 80
    }
  }
}

variable "target_groups" {
  type        = any
  description = "Target Groups"
  default = [
    {
      target_type      = "ip"
      backend_protocol = "HTTP"
      name             = "diet-planner-tg"
      backend_port     = 8080
    }
  ]
}

