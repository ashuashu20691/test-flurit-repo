resource "aws_security_group" "oracle_sg" {
  name        = "${var.project_name}-${var.environment}-oracle-sg"
  description = "Security group for Oracle RDS instance"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.project_name}-oracle-sg"
  }
}

resource "aws_security_group" "postgres_sg" {
  name        = "${var.project_name}-${var.environment}-postgres-sg"
  description = "Security group for PostgreSQL RDS instance"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.project_name}-postgres-sg"
  }
}

resource "aws_security_group" "redis_sg" {
  name        = "${var.project_name}-${var.environment}-redis-sg"
  description = "Security group for Redis cluster"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.project_name}-redis-sg"
  }
}

resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "${var.project_name}-postgres-subnet-group"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "${var.project_name}-postgres-subnet-group"
  }
}

resource "aws_db_subnet_group" "oracle_subnet_group" {
  name       = "${var.project_name}-oracle-subnet-group"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "${var.project_name}-oracle-subnet-group"
  }
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "${var.project_name}-redis-subnet-group"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "${var.project_name}-redis-subnet-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "oracle_ingress_ecs" {
  security_group_id            = aws_security_group.oracle_sg.id
  referenced_security_group_id = aws_security_group.ecs_sg.id
  from_port                    = 1521
  to_port                      = 1521
  ip_protocol                  = "tcp"
  description                  = "Allow ECS tasks to access the Oracle database"
}

resource "aws_vpc_security_group_ingress_rule" "postgres_ingress_ecs" {
  security_group_id            = aws_security_group.postgres_sg.id
  referenced_security_group_id = aws_security_group.ecs_sg.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  description                  = "Allow ECS tasks to access the PostgreSQL database"
}

resource "aws_vpc_security_group_ingress_rule" "redis_ingress_ecs" {
  security_group_id            = aws_security_group.redis_sg.id
  referenced_security_group_id = aws_security_group.ecs_sg.id
  from_port                    = 6379
  to_port                      = 6379
  ip_protocol                  = "tcp"
  description                  = "Allow ECS tasks to access the Redis cluster"
}

resource "aws_db_instance" "oracle_db" {
  identifier = "oracle-db"

  # Oracle RDS instance (AWS equivalent for OCI Autonomous DB)
  engine         = "oracle-se2"
  engine_version = "19"
  instance_class = var.oracle_instance_class
  license_model  = "license-included"

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = "ORCL"
  username = "admin"
  # Managed password via Secrets Manager
  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.oracle_subnet_group.id
  vpc_security_group_ids = [aws_security_group.oracle_sg.id]
  publicly_accessible    = false
  multi_az               = true

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  performance_insights_enabled = true
  deletion_protection          = true
  skip_final_snapshot          = false
  final_snapshot_identifier    = "oracle-db-final-snapshot"

  copy_tags_to_snapshot = true

  tags = {
    Name = "oracle-db"
  }
}

resource "aws_db_instance" "postgres_db" {
  identifier = "${var.project_name}-postgres"

  engine            = "postgres"
  engine_version    = "16.1"
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username

  manage_master_user_password = true

  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.postgres_subnet_group.name
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]

  storage_encrypted   = true
  publicly_accessible = false

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  performance_insights_enabled          = true
  performance_insights_retention_period = 7

  skip_final_snapshot       = false
  final_snapshot_identifier = "${var.project_name}-postgres-final-snapshot"

  deletion_protection = true

  copy_tags_to_snapshot      = true
  auto_minor_version_upgrade = true

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  tags = {
    Name = "${var.project_name}-postgres"
  }

  depends_on = [aws_ecs_service.app_service]
}

resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = "${var.project_name}-redis"
  engine               = "redis"
  engine_version       = "7.1"
  node_type            = var.redis_node_type
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  port                 = 6379

  subnet_group_name  = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids = [aws_security_group.redis_sg.id]

  snapshot_retention_limit = 7
  snapshot_window          = "05:00-06:00"
  maintenance_window       = "sun:05:00-sun:06:00"

  apply_immediately          = false
  auto_minor_version_upgrade = true
  transit_encryption_enabled = true

  tags = {
    Name = "${var.project_name}-redis"
  }

  depends_on = [aws_ecs_service.app_service]
}
