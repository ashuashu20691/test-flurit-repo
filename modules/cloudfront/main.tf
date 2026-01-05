module "cloudfront" {
  source                 = "terraform-aws-modules/cloudfront/aws"
  enabled                = var.enabled
  origin                 = var.origin
  default_cache_behavior = var.default_cache_behavior
  version                = "6.0.2"
}

