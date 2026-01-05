module "sg-mongodb" {
  source                                = "terraform-aws-modules/security-group/aws"
  name                                  = var.name
  vpc_id                                = var.vpc_id
  ingress_with_source_security_group_id = var.ingress_with_source_security_group_id
  version                               = "5.3.1"
}

