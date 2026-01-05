variable "name" {
  type        = string
  description = "Name of the VPC"
  default     = "diet-planner-vpc"
}

variable "cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets"
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnets"
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]
}

variable "database_subnets" {
  type        = list(string)
  description = "Database subnets"
  default = [
    "10.0.201.0/24",
    "10.0.202.0/24"
  ]
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT Gateway"
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Single NAT Gateway to save costs"
  default     = true
}

