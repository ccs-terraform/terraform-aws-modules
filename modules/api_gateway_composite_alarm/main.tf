module "api_gateway_4xx_error_rate_rest_api" {
  source                = "../../modules/api_gateway_error_rate_cloudwatch_alarm"
  api_name              = var.rest_api_api_name
  cloudwatch_alarm_name = "${var.error_rate_4xx_cloudwatch_alarm_name}_${var.rest_api_api_name}"
  label                 = var.error_rate_4xx_label
  metric_name           = var.error_rate_4xx_metric_name
  sns_topic_arn         = var.sns_topic_arn
}

module "api_gateway_5xx_error_rate_rest_api" {
  source                = "../../modules/api_gateway_error_rate_cloudwatch_alarm"
  api_name              = var.rest_api_api_name
  cloudwatch_alarm_name = "${var.error_rate_5xx_cloudwatch_alarm_name}_${var.rest_api_api_name}"
  label                 = var.error_rate_5xx_label
  metric_name           = var.error_rate_5xx_metric_name
  sns_topic_arn         = var.sns_topic_arn
}

module "api_gateway_conclave_rest_api_count" {
  source                = "../../modules/api_gateway_error_rate_cloudwatch_alarm"
  api_name              = var.rest_api_api_name
  cloudwatch_alarm_name = "${var.count_cloudwatch_alarm_name}_${var.rest_api_api_name}"
  label                 = var.count_metric
  metric_name           = var.count_metric
  sns_topic_arn         = var.sns_topic_arn
}

resource "aws_cloudwatch_composite_alarm" "conclave_rest_api_composite_4xx_error_rate" {
  alarm_name = "${var.error_rate_4xx_cloudwatch_alarm_name}_composite_${var.rest_api_api_name}"

  alarm_actions = [var.sns_topic_arn]
  alarm_rule    = "ALARM(${module.api_gateway_4xx_error_rate_rest_api.api_gateway_alarm_id}) AND ALARM(${module.api_gateway_conclave_rest_api_count.api_gateway_alarm_id})"
}

resource "aws_cloudwatch_composite_alarm" "conclave_rest_api_composite_5xx_error_rate" {
  alarm_name = "${var.error_rate_5xx_cloudwatch_alarm_name}_composite_${var.rest_api_api_name}"

  alarm_actions = [var.sns_topic_arn]
  alarm_rule    = "ALARM(${module.api_gateway_5xx_error_rate_rest_api.api_gateway_alarm_id}) AND ALARM(${module.api_gateway_conclave_rest_api_count.api_gateway_alarm_id})"
}
