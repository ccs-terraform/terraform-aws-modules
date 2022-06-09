resource "aws_internet_gateway" "ccs_api_gateway_reverse_proxy_internet_gateway" {
  vpc_id = aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}
