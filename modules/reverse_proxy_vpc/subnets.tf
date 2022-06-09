resource "aws_subnet" "ccs_api_gateway_reverse_proxy_nat_gateway_subnet" {
  availability_zone       = "eu-west-2a"
  cidr_block              = var.nat_gateway_subnet_cidr_block
  vpc_id                  = aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id
  map_public_ip_on_launch = true

  tags = {
    Name = var.nat_gateway_subnet_name
  }
}

resource "aws_subnet" "ccs_api_gateway_reverse_proxy_eu_west_2a" {
  availability_zone = "eu-west-2a"
  cidr_block        = var.reverse_proxy_eu_west_2a_cidr_block
  vpc_id            = aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id

  tags = {
    Name = var.reverse_proxy_eu_west_2a_subnet_name
  }
}

resource "aws_subnet" "ccs_api_gateway_reverse_proxy_eu_west_2b" {
  availability_zone = "eu-west-2b"
  cidr_block        = var.reverse_proxy_eu_west_2b_cidr_block
  vpc_id            = aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id

  tags = {
    Name = var.reverse_proxy_eu_west_2b_subnet_name
  }
}

resource "aws_subnet" "ccs_api_gateway_reverse_proxy_eu_west_2c" {
  availability_zone = "eu-west-2c"
  cidr_block        = var.reverse_proxy_eu_west_2c_cidr_block
  vpc_id            = aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id

  tags = {
    Name = var.reverse_proxy_eu_west_2c_subnet_name
  }
}
