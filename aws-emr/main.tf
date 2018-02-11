terraform {
  version = "~> 0.11"
  region  = "${var.region}"

  backend "s3" {
    encrypt = true
  }
}
