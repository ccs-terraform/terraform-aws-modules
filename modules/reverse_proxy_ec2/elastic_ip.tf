resource "aws_eip" "ccs_api_gateway_reverse_proxy_elastic_ip" {
  vpc = true

  tags = {
    Name = var.eip_name
  }
}
