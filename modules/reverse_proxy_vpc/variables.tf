variable "ansible_tower_ip_ranges" {
  default = ["52.56.38.176/32"]
}

variable "ccs_ip_ranges" {
  default = ["195.59.5.128/29", "51.149.9.112/29", "51.149.9.240/29", "51.149.8.0/25"]
}

variable "ccs_inbound_ssh_security_group_name" {}

variable "ccs_inbound_ssh_security_group_cidr_block" {}

variable "environment" {}

variable "internet_gateway_name" {}

variable "ipv4_cidr_block" {}

variable "nat_gateway_name" {}

variable "nat_gateway_subnet_cidr_block" {}

variable "nat_gateway_subnet_name" {}

variable "nlb_inbound_security_group_name" {}

variable "nlb_inbound_security_group_cidr_block" {}

variable "reverse_proxy_route_table_name" {}

variable "reverse_proxy_eu_west_2a_subnet_name" {}

variable "reverse_proxy_eu_west_2b_subnet_name" {}

variable "reverse_proxy_eu_west_2c_subnet_name" {}

variable "reverse_proxy_eu_west_2a_cidr_block" {}

variable "reverse_proxy_eu_west_2b_cidr_block" {}

variable "reverse_proxy_eu_west_2c_cidr_block" {}

variable "region" {}

variable "route_table_name" {}

variable "vpc_name" {}

variable "eip_name" {}
