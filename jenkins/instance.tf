data "aws_ami" "xenial_current" {
  most_recent = true
  name_regex  = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
  owners      = ["099720109477"]
}

data "aws_availability_zones" "available" {}

resource "aws_instance" "jenkins_instance" {
  ami                    = "${data.aws_ami.xenial_current.id}"
  instance_type          = "${var.master_instance_type}"
  subnet_id              = "${element(data.terraform_remote_state.vpc.vpc_public_subnets,0)}"
  vpc_security_group_ids = ["${data.terraform_remote_state.vpc.restricted_access_sg}"]
  key_name               = "${var.key_name}"
  user_data              = "${data.template_cloudinit_config.cloudinit_jenkins.rendered}"

}

resource "aws_ebs_volume" "jenkins_data" {
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
    size              = 10
    type              = "gp2"
    tags {
      Terraform   = "true"
      Environment = "${var.environment}"
      Name        = "${var.environment}-jenkins-data"
    }
}

resource "aws_volume_attachment" "jenkins_data_attachment" {
  device_name  = "${var.instance_device_name}"
  volume_id    = "${aws_ebs_volume.jenkins_data.id}"
  instance_id  = "${aws_instance.jenkins_instance.id}"
  skip_destroy = true
}
