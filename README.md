# Terraform Infrastructure

## Requirements

The following requirements are needed by this module:

- [terraform](#requirement_terraform) (>= 1.5.0)

- [aws](#requirement_aws) (~> 5.0)

## Providers

The following providers are used by this module:

- [aws](#provider_aws) (~> 5.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_apigatewayv2_api.http_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) (resource)
- [aws_apigatewayv2_integration.api_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration) (resource)
- [aws_apigatewayv2_route.api_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route) (resource)
- [aws_apigatewayv2_stage.api_stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage) (resource)
- [aws_apigatewayv2_vpc_link.api_vpc_link](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_vpc_link) (resource)
- [aws_cloudfront_distribution.cdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) (resource)
- [aws_cloudfront_origin_access_control.oac](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) (resource)
- [aws_cloudwatch_log_group.ecs_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) (resource)
- [aws_db_instance.oracle_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) (resource)
- [aws_db_instance.postgres_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) (resource)
- [aws_db_subnet_group.oracle_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) (resource)
- [aws_db_subnet_group.postgres_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) (resource)
- [aws_ecs_cluster.main_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) (resource)
- [aws_ecs_service.app_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) (resource)
- [aws_ecs_task_definition.app_task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) (resource)
- [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) (resource)
- [aws_elasticache_cluster.redis_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) (resource)
- [aws_elasticache_subnet_group.redis_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) (resource)
- [aws_iam_role.ecs_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) (resource)
- [aws_iam_role_policy_attachment.ecs_execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) (resource)
- [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) (resource)
- [aws_lb.ecs_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) (resource)
- [aws_lb_listener.ecs_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) (resource)
- [aws_lb_target_group.ecs_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) (resource)
- [aws_nat_gateway.main_nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) (resource)
- [aws_route.private_nat_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) (resource)
- [aws_route.public_internet_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) (resource)
- [aws_route_table.private_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) (resource)
- [aws_route_table.public_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) (resource)
- [aws_route_table_association.private_1_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) (resource)
- [aws_route_table_association.private_2_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) (resource)
- [aws_route_table_association.public_1_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) (resource)
- [aws_route_table_association.public_2_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) (resource)
- [aws_s3_bucket.assets_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) (resource)
- [aws_s3_bucket_policy.assets_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) (resource)
- [aws_s3_bucket_public_access_block.assets_pab](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) (resource)
- [aws_s3_bucket_versioning.assets_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) (resource)
- [aws_security_group.ecs_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
- [aws_security_group.oracle_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
- [aws_security_group.postgres_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
- [aws_security_group.redis_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
- [aws_subnet.private_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) (resource)
- [aws_subnet.private_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) (resource)
- [aws_subnet.public_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) (resource)
- [aws_subnet.public_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) (resource)
- [aws_vpc.main_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) (resource)
- [aws_vpc_security_group_egress_rule.ecs_egress_all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) (resource)
- [aws_vpc_security_group_ingress_rule.oracle_ingress_ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) (resource)
- [aws_vpc_security_group_ingress_rule.postgres_ingress_ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) (resource)
- [aws_vpc_security_group_ingress_rule.redis_ingress_ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) (resource)

## Required Inputs

The following input variables are required:

### [api_gateway_access_log_group_arn](#input_api_gateway_access_log_group_arn)

Description: The ARN of the CloudWatch Log Group for API Gateway access logs.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### [assets_bucket_name](#input_assets_bucket_name)

Description: The name of the S3 bucket for static assets.

Type: `string`

Default: `"my-app-assets-unique-id"`

### [az_1](#input_az_1)

Description: The first availability zone to use.

Type: `string`

Default: `"us-east-1a"`

### [az_2](#input_az_2)

Description: The second availability zone to use.

Type: `string`

Default: `"us-east-1b"`

### [container_image](#input_container_image)

Description: The Docker image to use for the container.

Type: `string`

Default: `"nginx:latest"`

### [container_port](#input_container_port)

Description: The port the container listens on.

Type: `number`

Default: `80`

### [db_allocated_storage](#input_db_allocated_storage)

Description: The allocated storage in gigabytes for the PostgreSQL RDS instance.

Type: `number`

Default: `20`

### [db_instance_class](#input_db_instance_class)

Description: The instance type of the PostgreSQL RDS instance.

Type: `string`

Default: `"db.t3.micro"`

### [db_name](#input_db_name)

Description: The name of the database to create when the PostgreSQL RDS instance is created.

Type: `string`

Default: `"myappdb"`

### [db_username](#input_db_username)

Description: Username for the master DB user.

Type: `string`

Default: `"dbadmin"`

### [ecs_cluster_name](#input_ecs_cluster_name)

Description: The name of the ECS cluster.

Type: `string`

Default: `"app-cluster"`

### [ecs_service_desired_count](#input_ecs_service_desired_count)

Description: The desired number of instances for the ECS service.

Type: `number`

Default: `2`

### [environment](#input_environment)

Description: The deployment environment (e.g., dev, staging, prod).

Type: `string`

Default: `"dev"`

### [log_retention_days](#input_log_retention_days)

Description: The number of days to retain CloudWatch logs.

Type: `number`

Default: `30`

### [oracle_instance_class](#input_oracle_instance_class)

Description: The instance type of the Oracle RDS instance.

Type: `string`

Default: `"db.t3.medium"`

### [private_subnet_1_cidr](#input_private_subnet_1_cidr)

Description: CIDR block for the first private subnet.

Type: `string`

Default: `"10.0.10.0/24"`

### [private_subnet_2_cidr](#input_private_subnet_2_cidr)

Description: CIDR block for the second private subnet.

Type: `string`

Default: `"10.0.11.0/24"`

### [project_name](#input_project_name)

Description: The name of the project used for resource naming and tagging.

Type: `string`

Default: `"my-app"`

### [public_subnet_1_cidr](#input_public_subnet_1_cidr)

Description: CIDR block for the first public subnet.

Type: `string`

Default: `"10.0.1.0/24"`

### [public_subnet_2_cidr](#input_public_subnet_2_cidr)

Description: CIDR block for the second public subnet.

Type: `string`

Default: `"10.0.2.0/24"`

### [redis_node_type](#input_redis_node_type)

Description: The compute and memory capacity of the nodes in the Redis cluster.

Type: `string`

Default: `"cache.t3.micro"`

### [region](#input_region)

Description: The AWS region where resources will be deployed.

Type: `string`

Default: `"us-east-1"`

### [task_cpu](#input_task_cpu)

Description: The number of CPU units used by the task.

Type: `number`

Default: `256`

### [task_memory](#input_task_memory)

Description: The amount of memory (in MiB) used by the task.

Type: `number`

Default: `512`

### [vpc_cidr](#input_vpc_cidr)

Description: The CIDR block for the VPC.

Type: `string`

Default: `"10.0.0.0/16"`

## Outputs

The following outputs are exported:

### [alb_dns_name](#output_alb_dns_name)

Description: The DNS name of the load balancer.

### [api_gateway_endpoint](#output_api_gateway_endpoint)

Description: The endpoint of the HTTP API Gateway.

### [cloudfront_domain_name](#output_cloudfront_domain_name)

Description: The domain name corresponding to the CloudFront distribution.

### [ecs_cluster_arn](#output_ecs_cluster_arn)

Description: The ARN of the ECS cluster.

### [ecs_service_name](#output_ecs_service_name)

Description: The name of the ECS service.

### [oracle_db_endpoint](#output_oracle_db_endpoint)

Description: The connection endpoint for the Oracle database.

### [postgres_db_endpoint](#output_postgres_db_endpoint)

Description: The connection endpoint for the PostgreSQL database.

### [private_subnet_ids](#output_private_subnet_ids)

Description: List of IDs of private subnets.

### [public_subnet_ids](#output_public_subnet_ids)

Description: List of IDs of public subnets.

### [redis_endpoint](#output_redis_endpoint)

Description: The DNS name of the Redis cache node.

### [s3_bucket_name](#output_s3_bucket_name)

Description: The name of the assets S3 bucket.

### [vpc_id](#output_vpc_id)

Description: The ID of the VPC.

## Usage

```bash
terraform init
terraform plan
terraform apply
```
