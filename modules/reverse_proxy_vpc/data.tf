data "aws_eip" "ccs_api_gateway_reverse_proxy_elastic_ip" {
  tags = {
    Name = var.eip_name
  }
}
