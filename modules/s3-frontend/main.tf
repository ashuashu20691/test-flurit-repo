module "s3-frontend" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  bucket        = var.bucket
  force_destroy = var.force_destroy
  version       = "5.9.1"
}

