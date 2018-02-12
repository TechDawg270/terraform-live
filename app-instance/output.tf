output "elb" {
	value = "${aws_elb.app_elb.dns_name}"
}
