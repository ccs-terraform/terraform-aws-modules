resource "aws_cloudwatch_metric_alarm" "nlb_target_reset_count_cloudwatch_alarm" {
  alarm_actions       = [var.sns_topic_arn]
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = 1
  evaluation_periods  = 1
  metric_name         = "TCP_Target_Reset_Count"
  namespace           = "AWS/NetworkELB"
  period              = 300
  statistic           = "Sum"
  threshold           = 1

  dimensions = {
    "AvailabilityZone" = var.availability_zone
    "LoadBalancer"     = var.load_balancer
  }
}