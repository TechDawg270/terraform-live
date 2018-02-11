output "iam_emr_profile" {
	description = "The ARN of the EMR Profile"
	value       = "${aws_iam_instance_profile.emr_profile.arn}"
}

output "iam_emr_service_role" {
	description = "The ARN of the EMR Service Role"
	value       = "${aws_iam_role.iam_emr_service_role.arn}"
}
