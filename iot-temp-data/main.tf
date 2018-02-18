terraform {
  version = "~> 0.11"
  region  = "${var.region}"

  backend "s3" {
    encrypt = true
  }
}

provider "aws" {
  region  = "${var.region}"
  version = "~> 1.0"
}

resource "aws_kinesis_stream" "kinesis_stream_raw_temp_data" {
  name             = "${var.environment}-kinesis-stream-raw-temp-data"
  shard_count      = 1
  retention_period = "${var.retention_period}"

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
