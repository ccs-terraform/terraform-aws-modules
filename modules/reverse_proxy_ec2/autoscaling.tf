resource "aws_autoscaling_group" "ccs_api_gateway_reverse_proxy_bastion_asg" {
  desired_capacity      = 1
  max_size              = 1
  min_size              = 1
  termination_policies  = ["OldestInstance"]
  name                  = "${var.ccs_api_gateway_reverse_proxy_bastion_component_name}_bastion_asg"
  protect_from_scale_in = false
  vpc_zone_identifier   = [data.aws_subnet.ccs_api_gateway_reverse_proxy_bastion_subnet.id]

  launch_template {
    id      = aws_launch_template.ccs_api_gateway_reverse_proxy_bastion_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = var.bastion_ec2_instance_name
  }

  enabled_metrics = [
    "GroupAndWarmPoolDesiredCapacity",
    "GroupAndWarmPoolTotalCapacity",
    "GroupDesiredCapacity",
    "GroupInServiceCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingCapacity",
    "GroupPendingInstances",
    "GroupStandbyCapacity",
    "GroupStandbyInstances",
    "GroupTerminatingCapacity",
    "GroupTerminatingInstances",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "WarmPoolDesiredCapacity",
    "WarmPoolMinSize",
    "WarmPoolPendingCapacity",
    "WarmPoolTerminatingCapacity",
    "WarmPoolTotalCapacity",
    "WarmPoolWarmedCapacity",
  ]
}

resource "aws_autoscaling_group" "ccs_api_gateway_reverse_proxy_2a_asg" {
  desired_capacity      = 1
  max_size              = 1
  min_size              = 1
  termination_policies  = ["OldestInstance"]
  name                  = "${var.ccs_api_gateway_reverse_proxy_eu_west_2a_component_name}_asg"
  protect_from_scale_in = false
  target_group_arns     = [aws_lb_target_group.ccs_api_gateway_reverse_proxy_target_group.arn]
  vpc_zone_identifier   = [data.aws_subnet.ccs_api_gateway_reverse_proxy_eu_west_2a_subnet.id]

  launch_template {
    id      = aws_launch_template.ccs_api_gateway_reverse_proxy_2a_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = var.reverse_proxy_eu_west_2a_instance_name
  }

  enabled_metrics = [
    "GroupAndWarmPoolDesiredCapacity",
    "GroupAndWarmPoolTotalCapacity",
    "GroupDesiredCapacity",
    "GroupInServiceCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingCapacity",
    "GroupPendingInstances",
    "GroupStandbyCapacity",
    "GroupStandbyInstances",
    "GroupTerminatingCapacity",
    "GroupTerminatingInstances",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "WarmPoolDesiredCapacity",
    "WarmPoolMinSize",
    "WarmPoolPendingCapacity",
    "WarmPoolTerminatingCapacity",
    "WarmPoolTotalCapacity",
    "WarmPoolWarmedCapacity",
  ]
}

resource "aws_autoscaling_group" "ccs_api_gateway_reverse_proxy_2b_asg" {
  desired_capacity      = 1
  max_size              = 1
  min_size              = 1
  termination_policies  = ["OldestInstance"]
  name                  = "${var.ccs_api_gateway_reverse_proxy_eu_west_2b_component_name}_asg"
  protect_from_scale_in = false
  target_group_arns     = [aws_lb_target_group.ccs_api_gateway_reverse_proxy_target_group.arn]
  vpc_zone_identifier   = [data.aws_subnet.ccs_api_gateway_reverse_proxy_eu_west_2b_subnet.id]

  launch_template {
    id      = aws_launch_template.ccs_api_gateway_reverse_proxy_2b_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = var.reverse_proxy_eu_west_2b_instance_name
  }

  enabled_metrics = [
    "GroupAndWarmPoolDesiredCapacity",
    "GroupAndWarmPoolTotalCapacity",
    "GroupDesiredCapacity",
    "GroupInServiceCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingCapacity",
    "GroupPendingInstances",
    "GroupStandbyCapacity",
    "GroupStandbyInstances",
    "GroupTerminatingCapacity",
    "GroupTerminatingInstances",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "WarmPoolDesiredCapacity",
    "WarmPoolMinSize",
    "WarmPoolPendingCapacity",
    "WarmPoolTerminatingCapacity",
    "WarmPoolTotalCapacity",
    "WarmPoolWarmedCapacity",
  ]
}

resource "aws_autoscaling_group" "ccs_api_gateway_reverse_proxy_2c_asg" {
  desired_capacity      = 1
  max_size              = 1
  min_size              = 1
  termination_policies  = ["OldestInstance"]
  name                  = "${var.ccs_api_gateway_reverse_proxy_eu_west_2c_component_name}_asg"
  protect_from_scale_in = false
  target_group_arns     = [aws_lb_target_group.ccs_api_gateway_reverse_proxy_target_group.arn]
  vpc_zone_identifier   = [data.aws_subnet.ccs_api_gateway_reverse_proxy_eu_west_2c_subnet.id]

  launch_template {
    id      = aws_launch_template.ccs_api_gateway_reverse_proxy_2c_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = var.reverse_proxy_eu_west_2c_instance_name
  }

  enabled_metrics = [
    "GroupAndWarmPoolDesiredCapacity",
    "GroupAndWarmPoolTotalCapacity",
    "GroupDesiredCapacity",
    "GroupInServiceCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingCapacity",
    "GroupPendingInstances",
    "GroupStandbyCapacity",
    "GroupStandbyInstances",
    "GroupTerminatingCapacity",
    "GroupTerminatingInstances",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "WarmPoolDesiredCapacity",
    "WarmPoolMinSize",
    "WarmPoolPendingCapacity",
    "WarmPoolTerminatingCapacity",
    "WarmPoolTotalCapacity",
    "WarmPoolWarmedCapacity",
  ]
}
