terraform {
  version = "~> 0.11"
  region  = "${var.region}"

  backend "s3" {
    encrypt = true
  }
}

resource "aws_kinesis_stream" "raw_temp_data_stream" {
  name             = "iot-raw-temp-data"
  shard_count      = 1
  retention_period = "${var.retention_period}"

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}

resource "aws_kinesis_stream" "raw_apache_log_data_stream" {
  name             = "raw-apache-log-data"
  shard_count      = 1
  retention_period = "${var.retention_period}"

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
