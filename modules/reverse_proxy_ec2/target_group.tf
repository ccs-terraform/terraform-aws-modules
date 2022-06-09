resource "aws_lb_target_group" "ccs_api_gateway_reverse_proxy_target_group" {
  name        = var.target_group_name
  target_type = var.target_type
  protocol    = var.protocol
  port        = var.port
  vpc_id      = data.aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id
}
