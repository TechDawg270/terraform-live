data "terraform_remote_state" "vpc" {
  backend = "s3"
  config{
    bucket = "${var.s3_terraform_bucket}"
    key    = "${var.environment}/network.tfstate"
    region = "${var.s3_bucket_region}"
  }
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_security_group" "postgresql" {

  name = "postgresql"

  description = "RDS postgres servers"
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"

  # Only postgres in
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${var.environment}-postgresql-db"

  engine            = "${var.engine}"
  engine_version    = "${var.engine_version}"
  instance_class    = "${var.instance_type}"
  allocated_storage = 5
  storage_encrypted = false

  name = "${var.environment}-postgresql-db"

  username = "${var.environment}user"

  password = "OhNoesPlainTextPwAreBadMkay!"
  port     = "${var.port}"

  vpc_security_group_ids = ["${aws_security_group.postgresql.id}"]

  maintenance_window = "${var.maintenance_window}"
  backup_window      = "${var.backup_window}"

  # disable backups to create DB faster
  # obviously not something to do in a prod setting
  backup_retention_period = 0

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }

  # DB subnet group
  subnet_ids = ["${data.terraform_remote_state.vpc.vpc_private_subnets}"]

  # DB parameter group
  family = "${var.parameter_group_family}"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "${var.environment}-postgresql-db"
}
