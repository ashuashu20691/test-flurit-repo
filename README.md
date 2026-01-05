# diet-planner-infrastructure

Infrastructure for Diet Planner application including VPC, ECS (EC2), RDS SQL Server, MongoDB on EC2, and S3/CloudFront frontend.

## Prerequisites

Before deploying this infrastructure, ensure you have:

- [Terraform](https://www.terraform.io/downloads) >= 1.14.0 installed
- AWS CLI configured with appropriate credentials
- AWS account with permissions to create the required resources

## Project Structure

```
.
├── modules/                    # Reusable module wrappers
│   └── vpc/
│       ├── main.tf           # Calls terraform-aws-modules/vpc/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── sg-alb/
│       ├── main.tf           # Calls terraform-aws-modules/security-group/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── sg-ecs/
│       ├── main.tf           # Calls terraform-aws-modules/security-group/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── sg-rds/
│       ├── main.tf           # Calls terraform-aws-modules/security-group/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── sg-mongodb/
│       ├── main.tf           # Calls terraform-aws-modules/security-group/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── rds/
│       ├── main.tf           # Calls terraform-aws-modules/rds/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── mongodb/
│       ├── main.tf           # Calls terraform-aws-modules/ec2-instance/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── alb/
│       ├── main.tf           # Calls terraform-aws-modules/alb/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── autoscaling/
│       ├── main.tf           # Calls terraform-aws-modules/autoscaling/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── ecs/
│       ├── main.tf           # Calls terraform-aws-modules/ecs/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── s3-frontend/
│       ├── main.tf           # Calls terraform-aws-modules/s3-bucket/aws
│       ├── variables.tf
│       └── outputs.tf
│   └── cloudfront/
│       ├── main.tf           # Calls terraform-aws-modules/cloudfront/aws
│       ├── variables.tf
│       └── outputs.tf
├── environments/               # Environment-specific configurations
│   └── dev/
├── README.md
└── .gitignore
```

## Modules

This infrastructure uses the following Terraform Registry modules:

### vpc

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/vpc/aws`](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws) |
| Version | `6.5.1` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** VPC with public, private, and database subnets

### sg-alb

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/security-group/aws`](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws) |
| Version | `5.3.1` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** Security Group for ALB

### sg-ecs

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/security-group/aws`](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws) |
| Version | `5.3.1` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** Security Group for ECS Nodes

### sg-rds

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/security-group/aws`](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws) |
| Version | `5.3.1` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** Security Group for RDS SQL Server

### sg-mongodb

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/security-group/aws`](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws) |
| Version | `5.3.1` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** Security Group for MongoDB EC2

### rds

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/rds/aws`](https://registry.terraform.io/modules/terraform-aws-modules/rds/aws) |
| Version | `7.0.1` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** RDS SQL Server Instance

### mongodb

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/ec2-instance/aws`](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws) |
| Version | `6.1.5` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** EC2 Instance for MongoDB

### alb

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/alb/aws`](https://registry.terraform.io/modules/terraform-aws-modules/alb/aws) |
| Version | `10.4.0` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** Application Load Balancer

### autoscaling

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/autoscaling/aws`](https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws) |
| Version | `8.0.0` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** Auto Scaling Group for ECS Capacity Provider

### ecs

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/ecs/aws`](https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws) |
| Version | `6.11.0` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** ECS Cluster and Service

### s3-frontend

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/s3-bucket/aws`](https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws) |
| Version | `5.9.1` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** S3 Bucket for Frontend

### cloudfront

| Property | Value |
|----------|-------|
| Source | [`terraform-aws-modules/cloudfront/aws`](https://registry.terraform.io/modules/terraform-aws-modules/cloudfront/aws) |
| Version | `6.0.2` |
| Publisher | terraform-aws-modules ✅ Verified |

**Purpose:** CloudFront Distribution

## Additional Resources

The following resources are created directly (no suitable module available):

| Resource | Type | Reason |
|----------|------|--------|
| `ecs_ami` | `aws_ssm_parameter` | Need to fetch the latest ECS optimized AMI for the region |

## Deployment

### Quick Start

```bash
# Navigate to the desired environment
cd environments/dev

# Initialize Terraform (downloads providers and modules)
terraform init

# Review the execution plan
terraform plan

# Apply the configuration
terraform apply
```

### Deploying to Different Environments

Each environment has its own configuration in `environments/<env>/`:

```bash
# Development
cd environments/dev && terraform init && terraform apply
```

## Variables Reference

| Name | Type | Description | Required | Default |
|------|------|-------------|----------|---------|
| `project_name` | `string` | Project name prefix | No | `"diet-planner"` |
| `region` | `string` | AWS Region | No | `"us-east-1"` |
| `db_username` | `string` | Database username | No | `"admin"` |

🔒 = Sensitive variable

## Outputs

After successful deployment, the following outputs will be available:

| Name | Description |
|------|-------------|
| `vpc_id` | VPC ID |
| `alb_dns_name` | ALB DNS Name |
| `rds_endpoint` | RDS Endpoint |
| `mongodb_ip` | MongoDB Private IP |
| `cloudfront_domain` | CloudFront Domain |

Access outputs after deployment:

```bash
terraform output

# Get a specific output
terraform output vpc_id
```

## Cleanup

To destroy all resources created by this configuration:

```bash
cd environments/<env>
terraform destroy
```

⚠️ **Warning:** This will permanently delete all resources. Review the plan carefully before confirming.

## CI/CD with GitHub Actions

This project includes a GitHub Actions workflow for automated infrastructure deployment.

### Workflow Location

```
.github/workflows/terraform-provision.yml
```

### Required GitHub Secrets & Variables

Configure these in your repository: **Settings → Secrets and variables → Actions**

#### AWS Configuration

| Type | Name | Description | Required |
|------|------|-------------|----------|
| Secret | `AWS_IAC_ROLE_ARN` | IAM role ARN for GitHub OIDC authentication | ✅ Yes |
| Variable | `AWS_REGION` | AWS region for deployment (default: us-east-1) | No |

#### AWS Setup Steps

1. **Create GitHub OIDC Provider** (one-time per AWS account):
   ```bash
   aws iam create-open-id-connect-provider \
     --url https://token.actions.githubusercontent.com \
     --client-id-list sts.amazonaws.com \
     --thumbprint-list 6938fd4d98bab03faadb97b34396831e3780aea1
   ```

2. **Create IAM Role** with trust policy for your repository

3. **Attach Permissions** - the role needs permissions for all resources in this project

4. **Add Secret to GitHub**:
   ```bash
   gh secret set AWS_IAC_ROLE_ARN --body "arn:aws:iam::ACCOUNT_ID:role/YourRoleName"
   ```

📚 [Full AWS OIDC Setup Guide](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)

### Running the Workflow

The workflow can be triggered:
- **Automatically** on push to `main` branch
- **Manually** via GitHub Actions UI (workflow_dispatch)

```bash
# Trigger manually via GitHub CLI
gh workflow run terraform-provision.yml -f environment=dev
```

---

*Generated by [Flurit AI](https://www.flurit.ai)*