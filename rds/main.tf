data "terraform_remote_state" "stack" {
  backend = "s3"
  config{
    bucket = "${var.s3_terraform_bucket}"
    key    = "${var.stack_name}/terraform.tfstate"
    region ="${var.aws_region}"
  }
}

module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = format("%s.%s", ${var.environment}, postgresqldb))

  engine            = "postgres"
  engine_version    = "9.6.3"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  storage_encrypted = false

  # kms_key_id        = "arm:aws:kms:<region>:<accound id>:key/<kms key id>"
  name = "demodb"

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  username = "demouser"

  password = "OhNoesPlainTextPwAreBadMkay!"
  port     = "5432"

  vpc_security_group_ids = ["${data.aws_security_group.default.id}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 0

  tags = {
    Terraform   = "true"
    Environment = "${var.region}"
  }

  # DB subnet group
  subnet_ids = ["${data.aws_subnet_ids.all.ids}"]

  # DB parameter group
  family = "postgres9.6"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "demodb"
}
