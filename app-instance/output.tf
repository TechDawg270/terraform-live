output "elb" {
  value = "${aws_elb.app_elb.dns_name}"
}

output "ami_name" {
  value = "${data.aws_ami.ami.name}"
}
