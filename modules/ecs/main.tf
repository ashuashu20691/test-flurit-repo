module "ecs" {
  source                         = "terraform-aws-modules/ecs/aws"
  cluster_name                   = var.cluster_name
  autoscaling_capacity_providers = var.autoscaling_capacity_providers
  services                       = var.services
  version                        = "6.11.0"
}

