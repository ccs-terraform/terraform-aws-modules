variable "key_name" {
  type        = string
  description = "SSH keypair name"
}

variable "store_in_root" {
  type        = bool
  description = "Store key in root of terraform"
  default     = true
}
