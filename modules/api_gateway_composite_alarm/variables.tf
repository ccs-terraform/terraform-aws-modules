variable "count_cloudwatch_alarm_name" {
  default = "api_gateway_count"
}

variable "count_metric" {
  default = "Count"
}

variable "error_rate_4xx_cloudwatch_alarm_name" {
  default = "api_gateway_4xx_error_rate"
}

variable "error_rate_4xx_label" {
  default = "4XXErrorRate"
}

variable "error_rate_4xx_metric_name" {
  default = "4XXError"
}

variable "error_rate_5xx_cloudwatch_alarm_name" {
  default = "api_gateway_5xx_error_rate"
}

variable "error_rate_5xx_label" {
  default = "5XXErrorRate"
}

variable "error_rate_5xx_metric_name" {
  default = "5XXError"
}

variable "rest_api_api_name" {}

variable "sns_topic_arn" {}
