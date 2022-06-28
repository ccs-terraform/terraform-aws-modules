variable "scale_down_cron" {}

variable "time_zone" {
  type        = "string"
  description = "The time zone to use."
  default     = "Europe/London"
}

variable "min_size" {}

variable "max_size" {}

variable "desired_capacity" {}
