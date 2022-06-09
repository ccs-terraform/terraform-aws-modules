resource "aws_cloudwatch_metric_alarm" "cloudfront_error_rate" {
  alarm_name          = var.cloudwatch_alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = 1
  evaluation_periods  = 1
  threshold           = var.threshold

  metric_query {
    id = "m1"
    return_data = false

    metric {
      dimensions = {
        "DistributionId" = var.cloudfront_distribution_id
        "Region"         = "Global"
      }
      metric_name = var.metric_name
      namespace   = "AWS/CloudFront"
      period = 300
      stat = "Sum"
    }
  }

  metric_query {
    id = "m2"
    return_data = false

    metric {
      dimensions = {
        "DistributionId" = var.cloudfront_distribution_id
        "Region"         = "Global"
      }
      metric_name = "Requests"
      namespace   = "AWS/CloudFront"
      period = 300
      stat = "Sum"
    }
  }

  metric_query {
    expression = "100*(m1/m2)"
    id = "e1"
    label = "Expression1"
    return_data = true
  }
}
