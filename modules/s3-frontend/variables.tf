variable "bucket" {
  type        = string
  description = "Bucket name"
  default     = "diet-planner-frontend-assets"
}

variable "force_destroy" {
  type        = bool
  description = "Force destroy"
  default     = true
}

