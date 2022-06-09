variable "alarm_name" {}

variable "availability_zone" {}

variable "region" {
  default = "eu-west-2"
}

variable "load_balancer" {}

variable "sns_topic_arn" {}
