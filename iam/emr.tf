# IAM role for EMR Service
resource "aws_iam_role" "iam_emr_service_role" {
  name               = "iam_emr_service_role"
  assume_role_policy = "${file("./files/iam_emr_service_role.json")}"
}

resource "aws_iam_role_policy" "iam_emr_service_policy" {
  name   = "iam_emr_service_policy"
  role   = "${aws_iam_role.iam_emr_service_role.id}"
  policy = "${file("./files/iam_emr_service_policy.json")}"
}

# IAM Role for EC2 Instance Profile
resource "aws_iam_role" "iam_emr_profile_role" {
  name               = "iam_emr_profile_role"
  assume_role_policy = "${file("./files/iam_emr_profile_role.json")}"
}

resource "aws_iam_instance_profile" "emr_profile" {
  name  = "emr_profile"
  role = "${aws_iam_role.iam_emr_profile_role.name}"
}

resource "aws_iam_role_policy" "iam_emr_profile_policy" {
  name = "iam_emr_profile_policy"
  role = "${aws_iam_role.iam_emr_profile_role.id}"
  policy = "${file("./files/iam_emr_profile_policy.json")}"
}
