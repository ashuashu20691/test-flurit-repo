variable "name" {
  type        = string
  description = "Name of the ASG"
  default     = "diet-planner-ecs-asg"
}

variable "min_size" {
  type        = number
  description = "Minimum size"
  default     = 1
}

variable "max_size" {
  type        = number
  description = "Maximum size"
  default     = 3
}

variable "desired_capacity" {
  type        = number
  description = "Desired capacity"
  default     = 2
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "VPC Zone Identifier (Subnets)"
}

variable "image_id" {
  type        = string
  description = "AMI ID (ECS Optimized)"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t3.medium"
}

variable "security_groups" {
  type        = list(string)
  description = "Security Groups"
}

variable "user_data" {
  type        = string
  description = "User data to register with ECS cluster"
}

variable "create_iam_instance_profile" {
  type        = bool
  description = "Create IAM instance profile"
  default     = true
}

variable "iam_role_policies" {
  type        = map(string)
  description = "IAM role policies"
  default = {
    AmazonEC2ContainerServiceforEC2Role = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
    AmazonSSMManagedInstanceCore        = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}

