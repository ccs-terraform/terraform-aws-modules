variable "bastion_ec2_instance_name" {}

variable "bastion_ec2_instance_type" {}

variable "ccs_api_gateway_reverse_proxy_bastion_component_name" {
  default = "ccs_api_gateway_reverse_proxy"
}

variable "ccs_api_gateway_reverse_proxy_eu_west_2a_component_name" {
  default = "ccs_api_gateway_reverse_proxy_eu_west_2a"
}

variable "ccs_api_gateway_reverse_proxy_eu_west_2b_component_name" {
  default = "ccs_api_gateway_reverse_proxy_eu_west_2b"
}

variable "ccs_api_gateway_reverse_proxy_eu_west_2c_component_name" {
  default = "ccs_api_gateway_reverse_proxy_eu_west_2c"
}

variable "ccs_inbound_ssh_security_group_name" {}

variable "ec2_key_pair_name" {}

variable "nat_gateway_subnet_name" {}

variable "nlb_name" {}

variable "nlb_inbound_security_group_name" {}

variable "reverse_proxy_eu_west_2a_instance_name" {}

variable "reverse_proxy_eu_west_2a_instance_type" {}

variable "reverse_proxy_eu_west_2a_subnet_name" {}

variable "reverse_proxy_eu_west_2b_instance_name" {}

variable "reverse_proxy_eu_west_2b_instance_type" {}

variable "reverse_proxy_eu_west_2b_subnet_name" {}

variable "reverse_proxy_eu_west_2c_instance_name" {}

variable "reverse_proxy_eu_west_2c_instance_type" {}

variable "reverse_proxy_eu_west_2c_subnet_name" {}

variable "region" {}

variable "reverse_proxy_config_s3_bucket_name" {}

variable "target_group_name" {}

variable "vpc_name" {}

variable "port" {
  default = 80
}

variable "protocol" {
  default = "TCP"
}

variable "target_type" {
  default = "instance"
}

variable "ccs_api_gateway_reverse_proxy_bastion_profile" {}

variable "ccs_api_gateway_reverse_proxy_eu_west_2a_profile" {}

variable "ccs_api_gateway_reverse_proxy_eu_west_2b_profile" {}

variable "ccs_api_gateway_reverse_proxy_eu_west_2c_profile" {}

variable "eip_name" {}

variable "kms_key_id" {}

variable "key_arn" {}
