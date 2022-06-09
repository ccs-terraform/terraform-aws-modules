variable "cloudfront_distribution_id" {}

variable "cloudwatch_alarm_name" {}

variable "metric_name" {}

variable "region" {
  default = "us-east-1"
}

variable "sns_topic_arn" {}

variable "threshold" {
  default = 5
}
