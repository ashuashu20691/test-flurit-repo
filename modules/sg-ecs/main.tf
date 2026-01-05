module "sg-ecs" {
  source                  = "terraform-aws-modules/security-group/aws"
  name                    = var.name
  vpc_id                  = var.vpc_id
  egress_with_cidr_blocks = var.egress_with_cidr_blocks
  version                 = "5.3.1"
}

