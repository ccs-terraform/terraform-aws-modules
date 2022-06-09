resource "aws_cloudwatch_metric_alarm" "ec2_network_packets_out_cloudwatch_alarm" {
  alarm_actions       = [var.sns_topic_arn]
  alarm_name          = var.alarm_name
  comparison_operator = "LessThanLowerOrGreaterThanUpperThreshold"
  datapoints_to_alarm = 2
  evaluation_periods  = 2
  threshold_metric_id = "ad1"

  metric_query {
    id          = "m1"
    return_data = true

    metric {
      dimensions = {
        "InstanceId" = var.instance_id
      }
      namespace   = "AWS/EC2"
      metric_name = "NetworkPacketsOut"
      period      = 300
      stat        = "Average"
    }
  }

  metric_query {
    id          = "ad1"
    expression  = "ANOMALY_DETECTION_BAND(m1, 2)"
    label       = "NetworkPacketsOut (expected)"
    return_data = true
  }
}
