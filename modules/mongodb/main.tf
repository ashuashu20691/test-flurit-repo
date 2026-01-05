module "mongodb" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  name                   = var.name
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = var.user_data
  version                = "6.1.5"
}

