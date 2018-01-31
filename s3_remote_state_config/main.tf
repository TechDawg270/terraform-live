data "aws_region" "current" {
  current = true
}

module "s3_remote_state_backend" {
  source = "../modules/s3_remote_state"

  name   = "${var.name}"
}
