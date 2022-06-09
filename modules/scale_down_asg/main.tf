resource "aws_autoscaling_schedule" "bastion_apig_scale_down" {
  scheduled_action_name  = "scale_down"
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
  recurrence             = var.scale_down_cron
  autoscaling_group_name = data.aws_autoscaling_group.ccs_api_gateway_reverse_proxy_bastion_asg.name
}

resource "aws_autoscaling_schedule" "reverse_proxy_a_apig_scale_down" {
  scheduled_action_name  = "scale_down"
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
  recurrence             = var.scale_down_cron
  autoscaling_group_name = data.aws_autoscaling_group.ccs_api_gateway_reverse_proxy_eu_west_2a_asg.name
}

resource "aws_autoscaling_schedule" "reverse_proxy_b_apig_scale_down" {
  scheduled_action_name  = "scale_down"
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
  recurrence             = var.scale_down_cron
  autoscaling_group_name = data.aws_autoscaling_group.ccs_api_gateway_reverse_proxy_eu_west_2b_asg.name
}

resource "aws_autoscaling_schedule" "reverse_proxy_c_apig_scale_down" {
  scheduled_action_name  = "scale_down"
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
  recurrence             = var.scale_down_cron
  autoscaling_group_name = data.aws_autoscaling_group.ccs_api_gateway_reverse_proxy_eu_west_2c_asg.name
}
