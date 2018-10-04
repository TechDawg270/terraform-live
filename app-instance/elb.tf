resource "aws_elb" "app_elb" {
  name            = "${var.environment}-elb"
  subnets         = ["${data.terraform_remote_state.vpc.vpc_public_subnets}"]
  security_groups = ["${aws_security_group.elb_securitygroup.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
