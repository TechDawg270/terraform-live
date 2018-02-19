resource "aws_security_group" "restricted_access" {
  vpc_id      = "${module.vpc.vpc_id}"
  name        = "restricted-access-sg"
  description = "Security Group that allows all traffic from home/office"

  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
      cidr_blocks = ["${var.access_ips}"]
  }

  tags {
    Terraform = "true"
  }
}
