resource "aws_security_group" "app_instance" {
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"
  name        = "${var.environment}-app-sg"
  description = "security group for my instance"

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      security_groups = ["${aws_security_group.elb_securitygroup.id}"]
  }

}

resource "aws_security_group" "elb_securitygroup" {
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"
  name        = "${var.environment}-elb-sg"
  description = "Security Group for application ELB"

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
