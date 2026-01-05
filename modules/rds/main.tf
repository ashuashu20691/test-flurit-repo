module "rds" {
  source                 = "terraform-aws-modules/rds/aws"
  identifier             = var.identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  username               = var.username
  port                   = var.port
  subnet_ids             = var.subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids
  family                 = var.family
  major_engine_version   = var.major_engine_version
  version                = "7.0.1"
}

