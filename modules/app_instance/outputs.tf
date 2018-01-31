output "ami_name" {
  description = "The name of the AMI used to launch the instance"
  value       = "${data.aws_ami.web_app_ami.name}"
}

output "ec2_id" {
  description = "The ID of the EC2 instance"
  value       = "${aws_instance.ec2_instance.id}"
}
