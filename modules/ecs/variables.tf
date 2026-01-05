variable "cluster_name" {
  type        = string
  description = "Cluster Name"
  default     = "diet-planner-cluster"
}

variable "autoscaling_capacity_providers" {
  type        = any
  description = "Capacity Providers"
}

variable "services" {
  type        = any
  description = "Services definition"
}

