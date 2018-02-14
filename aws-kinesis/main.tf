terraform {
  version = "~> 0.11"
  region  = "${var.region}"

  backend "s3" {
    encrypt = true
  }
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_kinesis_stream" "raw_apache_log_data_stream" {
  name             = "raw-apache-log-data"
  shard_count      = 2
  retention_period = "${var.retention_period}"

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
