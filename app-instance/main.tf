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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config{
    bucket = "${var.s3_terraform_bucket}"
    key    = "${var.environment}/network.tfstate"
    region = "${var.s3_bucket_region}"
  }
}
