output "api_gateway_alarm_id" {
  value = aws_cloudwatch_metric_alarm.api_gateway_error_rate.id
}
