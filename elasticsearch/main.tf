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

resource "aws_elasticsearch_domain" "es_domain" {
  domain_name           = "${var.environment}-es-domain"
  elasticsearch_version = "${var.es_version}"

  cluster_config {
    instance_count           = "${var.cluster_instance_count}"
    instance_type            = "${var.cluster_instance_type}"
    dedicated_master_enabled = "${var.enable_dedicated_master}"
    zone_awareness_enabled   = "${var.enable_zone_awareness}"
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  access_policies = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "es:*",
      "Resource": "arn:aws:es:*:*:*"
    }
  ]
}
CONFIG

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  tags {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}

resource "aws_iam_role" "firehose_role" {
  name = "${var.environment}-firehose-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "firehose_role_policy" {
  name = "${var.environment}-firehose-role-policy"
  role = "${aws_iam_role.firehose_role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1493060054000",
      "Effect": "Allow",
      "Action": [
          "s3:GetObject*",
          "s3:PutObject*"
      ],
      "Resource": ["arn:aws:s3:::*"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "kinesis:DescribeStream",
        "kinesis:GetShardIterator",
        "kinesis:GetRecords",
        "kinesis:ListStreams",
        "kinesis:PutRecords"
      ],
      "Resource": "arn:aws:kinesis:*:*:*"
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "bucket" {
  bucket = "iot-kinesis-temp-data"
  acl    = "private"
}
