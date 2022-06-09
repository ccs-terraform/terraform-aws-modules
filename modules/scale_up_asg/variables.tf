variable "scale_up_cron" {
  type        = string
  description = "The time when the recurring scale up action start.Cron format"
  default     = "00 09 * * *"
}

variable "min_size" {}

variable "max_size" {}

variable "desired_capacity" {}
