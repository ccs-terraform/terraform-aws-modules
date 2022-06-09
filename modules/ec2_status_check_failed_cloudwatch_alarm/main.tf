resource "aws_cloudwatch_metric_alarm" "ec2_status_check_failed_cloudwatch_alarm" {
  alarm_actions       = [var.sns_topic_arn]
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = 1
  evaluation_periods  = 1
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Sum"

  dimensions = {
    "InstanceId" = var.instance_id
  }
}
