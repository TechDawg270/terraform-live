data "aws_ami" "web_app_ami" {
  most_recent = true
  name_regex  = "${var.role}-*"
  owners      = ["self"]
}

resource "aws_instance" "ec2_instance" {
  count                  = "${var.count}"
  ami                    = "${data.aws_ami.web_app_ami.id}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.ssh_key_name}"
  vpc_security_group_ids = ["${split(",", var.vpc_security_group_ids_csv)}"]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "${var.role}"
    Project     = "${var.project}"
    Environment = "${var.environment}"
  }
}
