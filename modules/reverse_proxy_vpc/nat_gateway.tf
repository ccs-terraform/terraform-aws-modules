resource "aws_nat_gateway" "ccs_api_gateway_reverse_proxy_nat_gateway" {
  allocation_id = data.aws_eip.ccs_api_gateway_reverse_proxy_elastic_ip.id
  subnet_id     = aws_subnet.ccs_api_gateway_reverse_proxy_nat_gateway_subnet.id

  tags = {
    Name = var.nat_gateway_name
  }
}
