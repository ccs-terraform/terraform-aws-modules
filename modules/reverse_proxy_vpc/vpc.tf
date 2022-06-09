resource "aws_vpc" "ccs_api_gateway_reverse_proxy_vpc" {
  cidr_block = var.ipv4_cidr_block

  tags = {
    Name = var.vpc_name
  }
}
