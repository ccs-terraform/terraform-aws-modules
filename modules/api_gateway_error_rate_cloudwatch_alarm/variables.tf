variable "api_name" {}

variable "cloudwatch_alarm_name" {}

variable "label" {}

variable "metric_name" {}

variable "sns_topic_arn" {}

variable "threshold" {
  default = 5
}
