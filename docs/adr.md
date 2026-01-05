# Infrastructure Architecture for Diet Planner Application on AWS

**Status:** Accepted
**Cloud Provider:** aws
**Target Environments:** dev, staging, prod

## Summary

This Architecture Decision Record defines the cloud infrastructure for the Diet Planner fitness tracker application. The system is composed of Java/Spring Boot microservices and a ReactJS frontend. To strictly adhere to mandatory user constraints, the container orchestration for microservices will be handled by AWS ECS (Elastic Container Service) with EC2 launch type. Structured data storage will utilize AWS RDS provisioning the Microsoft SQL Server engine. Unstructured data requirements will be met by deploying a self-managed MongoDB Community Edition running on an EC2 instance. The ReactJS frontend will be deployed using AWS S3 Static Website Hosting combined with CloudFront (CDN) for global delivery. Finally, an Application Load Balancer (ALB) will be provisioned to manage traffic distribution and provide SSL termination for the microservices.

## Context

### Business Drivers

- Leverage existing team expertise in Java, Microsoft SQL Server, and MongoDB administration.
- Optimize infrastructure costs by using Community Edition software for NoSQL requirements.
- Ensure granular control over container host infrastructure for performance tuning.
- Provide low-latency global access for the frontend user interface.

### Technical Constraints

- Container orchestration MUST use AWS ECS (Elastic Container Service) with EC2 launch type (Recommended for microservices).
- Structured database engine MUST be Microsoft SQL Server via AWS RDS.
- Unstructured database MUST be Self-managed MongoDB Community Edition running on an EC2 instance.
- Frontend deployment MUST use AWS S3 Static Website Hosting + CloudFront (CDN).
- Traffic distribution MUST use an Application Load Balancer (ALB) for traffic distribution and SSL termination.

### Compliance Requirements

- All data must be encrypted at rest using AWS KMS.
- Database components must be isolated in private network subnets.
- TLS encryption required for data in transit.

## Decision

### Selected Approach

The architecture utilizes a multi-AZ VPC design. Microservices are deployed as Docker containers on AWS ECS using the EC2 Launch Type, managed by Auto Scaling Groups. Structured data resides in AWS RDS for SQL Server, while unstructured data is hosted on a hardened EC2 instance running MongoDB Community Edition. The frontend is served serverless via S3 and CloudFront. An internet-facing ALB routes API traffic to the ECS cluster.

### Key Services

#### AWS ECS (Elastic Container Service)

**Purpose:** Container orchestration for Java/Spring Boot microservices.

**Configuration:** EC2 launch type with Capacity Providers and Auto Scaling Groups.

#### AWS RDS

**Purpose:** Managed relational database for structured user and fitness data.

**Configuration:** Microsoft SQL Server engine (Standard/Web Edition) in Multi-AZ deployment.

#### AWS EC2

**Purpose:** Hosting the unstructured NoSQL database.

**Configuration:** Self-managed MongoDB Community Edition running on an EBS-optimized EC2 instance.

#### AWS S3 + CloudFront

**Purpose:** Hosting and content delivery for the ReactJS frontend.

**Configuration:** S3 Static Website Hosting + CloudFront (CDN) with OAC.

#### Application Load Balancer (ALB)

**Purpose:** Ingress traffic management and security.

**Configuration:** Internet-facing ALB for traffic distribution and SSL termination.

### Network Topology

A VPC spanning 2+ Availability Zones. Public Subnets host the ALB and NAT Gateways. Private Application Subnets host the ECS EC2 instances. Private Data Subnets host the RDS SQL Server and the MongoDB EC2 instance. S3 is accessed via CloudFront (Public) and VPC Endpoints (Private).

### Security Boundaries

The ALB acts as the primary public entry point (DMZ). Security Groups enforce strict allow-listing: ALB allows 443 from 0.0.0.0/0; ECS hosts allow traffic only from ALB; RDS and MongoDB EC2 allow traffic only from ECS hosts. The MongoDB instance is isolated with no internet access, managed via SSM.

## Alternatives Considered

### AWS ECS Fargate

**Trade-offs:** Reduces operational overhead of managing EC2 instances but offers less control over the underlying host.

**Rejection Reason:** Rejected because the requirement explicitly specifies AWS ECS with EC2 launch type.

### MongoDB Atlas

**Trade-offs:** Fully managed SaaS offering with automated backups and scaling.

**Rejection Reason:** Rejected because the requirement explicitly specifies Self-managed MongoDB Community Edition on EC2.

### Amazon Aurora (PostgreSQL/MySQL)

**Trade-offs:** Cloud-native database with high performance and lower licensing costs.

**Rejection Reason:** Rejected because the requirement explicitly specifies Microsoft SQL Server.

## Implementation

### Terraform Modules

#### vpc-network

**Purpose:** Provisions VPC, public/private subnets, NAT Gateways, and Route Tables.

#### security-groups

**Purpose:** Defines network access rules for ALB, ECS, RDS, and MongoDB.

**Dependencies:** vpc-network

#### db-sqlserver

**Purpose:** Deploys AWS RDS with Microsoft SQL Server engine.

**Dependencies:** vpc-network, security-groups

#### db-mongodb-ec2

**Purpose:** Deploys EC2 instance with EBS volumes for self-managed MongoDB.

**Dependencies:** vpc-network, security-groups

#### ecs-compute

**Purpose:** Deploys ECS Cluster, Launch Templates, and Auto Scaling Groups (EC2 type).

**Dependencies:** vpc-network, security-groups, db-sqlserver, db-mongodb-ec2

#### load-balancer

**Purpose:** Deploys ALB, Listeners, and Target Groups.

**Dependencies:** vpc-network, security-groups

#### frontend-static

**Purpose:** Deploys S3 bucket and CloudFront distribution.

### Provider Configuration

HashiCorp AWS Provider, region-specific configuration, default tags for cost allocation.

### State Management

Remote state stored in AWS S3 with DynamoDB table for state locking.

### Deployment Order

1. vpc-network
2. security-groups
3. db-sqlserver
4. db-mongodb-ec2
5. load-balancer
6. ecs-compute
7. frontend-static

## Security

### IAM Strategy

Implementation of Least Privilege Access. ECS Task Roles for service permissions. EC2 Instance Profiles for ECS Agents and SSM. Service-linked roles for Auto Scaling.

### Network Security

VPC segmentation into Public and Private zones. Security Groups acting as stateful firewalls. NACLs for stateless subnet filtering. WAF attached to ALB and CloudFront.

### Encryption

AWS KMS Customer Managed Keys (CMK) for encrypting RDS, EBS volumes (MongoDB), and S3 buckets. TLS 1.2+ enforced for all data in transit via ALB and CloudFront.

### Compliance Controls

- AWS Config for resource configuration tracking.
- CloudTrail for API activity auditing.
- VPC Flow Logs for network traffic monitoring.

## Risks

### Operational overhead of Self-managed MongoDB

**Severity:** high

**Mitigation:** Implement automated EBS snapshots via Data Lifecycle Manager and use CloudWatch for disk/memory monitoring.

### Microsoft SQL Server Licensing Costs

**Severity:** medium

**Mitigation:** Utilize Reserved Instances for RDS and select the appropriate edition (Web/Standard) based on feature needs.

### Management complexity of ECS EC2 Launch Type

**Severity:** medium

**Mitigation:** Utilize ECS Capacity Providers to automate the scaling of the underlying EC2 infrastructure based on task load.
