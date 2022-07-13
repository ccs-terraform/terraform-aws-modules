variable "description" {
  type    = string
  default = "KMS key to be used for the ebs volumes for api gateway environments."
}

variable "deletion_window" {
  type    = number
  default = 7
}

variable "key_usage" {
  type    = string
  default = "ENCRYPT_DECRYPT"
}

variable "enabled" {
  type    = bool
  default = true
}

variable "key_spec" {
  type    = string
  default = "SYMMETRIC_DEFAULT"
}

variable "environment" {}

variable "policy" {}
