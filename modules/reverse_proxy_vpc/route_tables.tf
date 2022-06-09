resource "aws_route_table" "ccs_api_gateway_reverse_proxy_route_table" {
  vpc_id = aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ccs_api_gateway_reverse_proxy_nat_gateway.id
  }

  tags = {
    Name = var.reverse_proxy_route_table_name
  }
}

resource "aws_route_table" "ccs_api_gateway_reverse_proxy_bastion_route_table" {
  vpc_id = aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ccs_api_gateway_reverse_proxy_internet_gateway.id
  }

  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "ccs_api_gateway_reverse_proxy_bastion_association" {
  route_table_id = aws_route_table.ccs_api_gateway_reverse_proxy_bastion_route_table.id
  subnet_id      = aws_subnet.ccs_api_gateway_reverse_proxy_nat_gateway_subnet.id
}

resource "aws_route_table_association" "ccs_api_gateway_reverse_proxy_eu_west_2a_route_table_association" {
  route_table_id = aws_route_table.ccs_api_gateway_reverse_proxy_route_table.id
  subnet_id      = aws_subnet.ccs_api_gateway_reverse_proxy_eu_west_2a.id
}

resource "aws_route_table_association" "ccs_api_gateway_reverse_proxy_eu_west_2b_route_table_association" {
  route_table_id = aws_route_table.ccs_api_gateway_reverse_proxy_route_table.id
  subnet_id      = aws_subnet.ccs_api_gateway_reverse_proxy_eu_west_2b.id
}

resource "aws_route_table_association" "ccs_api_gateway_reverse_proxy_eu_west_2c_route_table_association" {
  route_table_id = aws_route_table.ccs_api_gateway_reverse_proxy_route_table.id
  subnet_id      = aws_subnet.ccs_api_gateway_reverse_proxy_eu_west_2c.id
}
