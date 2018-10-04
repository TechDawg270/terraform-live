resource "aws_sns_topic" "asg_slack_notify" {
  name         = "slack-notify-asg"
  display_name = "Autoscaling Notifications to Slack"
}

resource "aws_autoscaling_notification" "slack_notify" {
  group_names = ["${aws_autoscaling_group.app_autoscaling_group.name}"]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = "${aws_sns_topic.asg_slack_notify.arn}"
}
