module "autoscaling" {
  source                      = "terraform-aws-modules/autoscaling/aws"
  name                        = var.name
  min_size                    = var.min_size
  max_size                    = var.max_size
  desired_capacity            = var.desired_capacity
  vpc_zone_identifier         = var.vpc_zone_identifier
  image_id                    = var.image_id
  instance_type               = var.instance_type
  security_groups             = var.security_groups
  user_data                   = var.user_data
  create_iam_instance_profile = var.create_iam_instance_profile
  iam_role_policies           = var.iam_role_policies
  version                     = "8.0.0"
}

