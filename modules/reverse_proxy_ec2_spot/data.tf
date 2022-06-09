data "aws_security_group" "ccs_inbound_ssh_security_group_name" {
  name = var.ccs_inbound_ssh_security_group_name
}

data "aws_security_group" "nlb_inbound_security_group_name" {
  name = var.nlb_inbound_security_group_name
}

data "aws_subnet" "ccs_api_gateway_reverse_proxy_bastion_subnet" {
  tags = {
    Name = var.nat_gateway_subnet_name
  }
}

data "aws_subnet" "ccs_api_gateway_reverse_proxy_eu_west_2a_subnet" {
  tags = {
    Name = var.reverse_proxy_eu_west_2a_subnet_name
  }
}

data "aws_subnet" "ccs_api_gateway_reverse_proxy_eu_west_2b_subnet" {
  tags = {
    Name = var.reverse_proxy_eu_west_2b_subnet_name
  }
}

data "aws_subnet" "ccs_api_gateway_reverse_proxy_eu_west_2c_subnet" {
  tags = {
    Name = var.reverse_proxy_eu_west_2c_subnet_name
  }
}

data "aws_vpc" "ccs_api_gateway_reverse_proxy_vpc" {
  tags = {
    Name = var.vpc_name
  }
}
