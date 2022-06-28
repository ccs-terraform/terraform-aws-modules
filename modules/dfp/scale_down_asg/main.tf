resource "aws_autoscaling_schedule" "bastion_dfp_scale_down" {
  scheduled_action_name  = "scale_down"
  min_size               = "${var.min_size}"
  max_size               = "${var.max_size}"
  desired_capacity       = "${var.desired_capacity}"
  recurrence             = "${var.scale_down_cron}"
  autoscaling_group_name = "${data.aws_autoscaling_group.bastion_dfp_asg.name}"
  time_zone              = "${var.time_zone}"
}

resource "aws_autoscaling_schedule" "api_dfp_scale_down" {
  scheduled_action_name  = "scale_down"
  min_size               = "${var.min_size}"
  max_size               = "${var.max_size}"
  desired_capacity       = "${var.desired_capacity}"
  recurrence             = "${var.scale_down_cron}"
  autoscaling_group_name = "${data.aws_autoscaling_group.api_dfp_asg.name}"
  time_zone              = "${var.time_zone}"
}

resource "aws_autoscaling_schedule" "app_dfp_scale_down" {
  scheduled_action_name  = "scale_down"
  min_size               = "${var.min_size}"
  max_size               = "${var.max_size}"
  desired_capacity       = "${var.desired_capacity}"
  recurrence             = "${var.scale_down_cron}"
  autoscaling_group_name = "${data.aws_autoscaling_group.app_dfp_asg.name}"
  time_zone              = "${var.time_zone}"
}
