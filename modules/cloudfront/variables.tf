variable "enabled" {
  type        = bool
  description = "Enable distribution"
  default     = true
}

variable "origin" {
  type        = any
  description = "Origin configuration"
}

variable "default_cache_behavior" {
  type        = any
  description = "Default cache behavior"
}

