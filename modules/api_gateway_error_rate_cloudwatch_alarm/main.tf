resource "aws_cloudwatch_metric_alarm" "api_gateway_error_rate" {
  alarm_name          = var.cloudwatch_alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = 1
  evaluation_periods  = 1
  threshold           = var.threshold

  metric_query {
    id          = "m1"
    return_data = false

    metric {
      dimensions = {
        "ApiName" = var.api_name
      }
      metric_name = var.metric_name
      namespace   = "AWS/ApiGateway"
      period      = 300
      stat        = "Sum"
    }
  }

  metric_query {
    id          = "m2"
    return_data = false

    metric {
      dimensions = {
        "ApiName" = var.api_name
      }
      metric_name = "Count"
      namespace   = "AWS/ApiGateway"
      period      = 300
      stat        = "Sum"
    }
  }

  metric_query {
    expression  = "100*(m1/m2)"
    id          = "e1"
    label       = var.label
    return_data = true
  }
}
