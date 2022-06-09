variable "scale_down_cron" {
  type        = string
  description = "The time when the recurring scale down action start.Cron format"
  default     = "00 17 * * *"
}

variable "min_size" {}

variable "max_size" {}

variable "desired_capacity" {}
