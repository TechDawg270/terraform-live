data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "${var.role}*"
  owners      = ["self"]
}

resource "aws_launch_configuration" "app_launchconfig" {
  name_prefix          = "${var.environment}-app-launchconfig"
  image_id             = "${data.aws_ami.ami.id}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${aws_security_group.app_instance.id}"]
  user_data            = "INSTANCE_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)\necho 'this is: '$INSTANCE_IP > /var/www/html/index.html"

  lifecycle {
      create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app_autoscaling_group" {
  name                      = "${var.environment}-autoscaling-group"
  vpc_zone_identifier       = ["${data.terraform_remote_state.vpc.vpc_public_subnets}"]
  launch_configuration      = "${aws_launch_configuration.app_launchconfig.name}"
  min_size                  = 2
  max_size                  = 5
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = ["${aws_elb.app_elb.name}"]
  force_delete              = true

  tags {
      Terraform           = "true"
      propagate_at_launch = true
  }
}
