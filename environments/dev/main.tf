terraform {
  required_version = ">= 1.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.27.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"
  name   = "${var.project_name}-vpc"
  cidr   = "10.0.0.0/16"
  azs = [
    "us-east-1a",
    "us-east-1b"
  ]
  private_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
  public_subnets = [
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]
  database_subnets = [
    "10.0.201.0/24",
    "10.0.202.0/24"
  ]
  enable_nat_gateway = true
  single_nat_gateway = true
}

module "sg-alb" {
  source = "../../modules/sg-alb"
  name   = "${var.project_name}-alb-sg"
  vpc_id = module.vpc.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "HTTPS"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "sg-ecs" {
  source = "../../modules/sg-ecs"
  name   = "${var.project_name}-ecs-sg"
  vpc_id = module.vpc.vpc_id
  ingress_with_source_security_group_id = [
    {
      from_port                = 0
      to_port                  = 65535
      protocol                 = "tcp"
      description              = "All from ALB"
      source_security_group_id = module.sg-alb.security_group_id
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "sg-rds" {
  source = "../../modules/sg-rds"
  name   = "${var.project_name}-rds-sg"
  vpc_id = module.vpc.vpc_id
  ingress_with_source_security_group_id = [
    {
      from_port                = 1433
      to_port                  = 1433
      protocol                 = "tcp"
      description              = "MSSQL from ECS"
      source_security_group_id = module.sg-ecs.security_group_id
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "sg-mongodb" {
  source = "../../modules/sg-mongodb"
  name   = "${var.project_name}-mongodb-sg"
  vpc_id = module.vpc.vpc_id
  ingress_with_source_security_group_id = [
    {
      from_port                = 27017
      to_port                  = 27017
      protocol                 = "tcp"
      description              = "MongoDB from ECS"
      source_security_group_id = module.sg-ecs.security_group_id
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "rds" {
  source            = "../../modules/rds"
  identifier        = "${var.project_name}-db"
  engine            = "sqlserver-web"
  engine_version    = "15.00.4043.16.v1"
  instance_class    = "db.t3.medium"
  allocated_storage = 20
  username          = var.db_username
  port              = 1433
  subnet_ids        = module.vpc.database_subnets
  vpc_security_group_ids = [
    module.sg-rds.security_group_id
  ]
  family                    = "sqlserver-web-15.0"
  major_engine_version      = "15.00"
  create_db_option_group    = false
  create_db_parameter_group = false
}

module "mongodb" {
  source        = "../../modules/mongodb"
  name          = "${var.project_name}-mongodb"
  instance_type = "t3.medium"
  subnet_id     = element(module.vpc.private_subnets, 0)
  vpc_security_group_ids = [
    module.sg-mongodb.security_group_id
  ]
  user_data = "#!/bin/bash\necho 'Installing MongoDB'"
}

module "alb" {
  source  = "../../modules/alb"
  name    = "${var.project_name}-alb"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  security_groups = [
    module.sg-alb.security_group_id
  ]
}

module "autoscaling" {
  source              = "../../modules/autoscaling"
  name                = "${var.project_name}-asg"
  min_size            = 1
  max_size            = 3
  desired_capacity    = 2
  vpc_zone_identifier = module.vpc.private_subnets
  image_id            = "ami-0c55b159cbfafe1f0"
  instance_type       = "t3.medium"
  security_groups = [
    module.sg-ecs.security_group_id
  ]
  user_data                   = "IyEvYmluL2Jhc2gKZWNobyAiRUNTX0NMVVNURVI9ZGlldC1wbGFubmVyLWNsdXN0ZXIiID4+IC9ldGMvZWNzL2Vjcy5jb25maWc="
  create_iam_instance_profile = true
  iam_role_policies = {
    AmazonEC2ContainerServiceforEC2Role = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
    AmazonSSMManagedInstanceCore        = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}

module "ecs" {
  source       = "../../modules/ecs"
  cluster_name = "${var.project_name}-cluster"
}

module "s3-frontend" {
  source        = "../../modules/s3-frontend"
  bucket        = "${var.project_name}-frontend-assets"
  force_destroy = true
}

module "cloudfront" {
  source              = "../../modules/cloudfront"
  enabled             = true
  comment             = "Frontend distribution"
  default_root_object = "index.html"
  price_class         = "PriceClass_100"
}

