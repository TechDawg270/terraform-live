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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config{
    bucket = "${var.s3_terraform_bucket}"
    key    = "${var.environment}/network.tfstate"
    region = "${var.s3_bucket_region}"
  }
}

data "terraform_remote_state" "iam" {
  backend = "s3"
  config{
    bucket = "${var.s3_terraform_bucket}"
    key    = "${var.environment}/iam.tfstate"
    region = "${var.s3_bucket_region}"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    ignore_changes = ["ingress", "egress"]
  }

  tags {
    Terraform = "true"
  }
}

resource "aws_emr_cluster" "emr_cluster" {
  name          = "${var.environment}-emr-cluster"
  release_label = "${var.release_label}"
  applications  = ["${var.applications}"]

  termination_protection = true

  ec2_attributes {
    subnet_id                         = "${data.terraform_remote_state.vpc.vpc_private_subnets[0]}"
    emr_managed_master_security_group = "${aws_security_group.allow_all.id}"
    emr_managed_slave_security_group  = "${aws_security_group.allow_all.id}"
    instance_profile                  = "${data.terraform_remote_state.iam.iam_emr_profile.arn}"
  }

  ebs_root_volume_size = "${var.ebs_root_volume_size}"
  master_instance_type = "${var.master_instance_type}"
  core_instance_type   = "${var.core_instance_type}"
  core_instance_count  = "${var.core_instance_count}"

  tags {
    Terraform   = "true"
    Environment = "${var.environment}"
  }

  service_role = "${data.terraform_remote_state.iam.iam_emr_service_role.arn}"
}
