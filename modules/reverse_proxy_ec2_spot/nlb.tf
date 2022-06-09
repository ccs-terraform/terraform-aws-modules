resource "aws_lb" "ccs_api_gateway_reverse_proxy_nlb" {
  name                             = var.nlb_name
  load_balancer_type               = "network"
  internal                         = true
  ip_address_type                  = "ipv4"
  enable_cross_zone_load_balancing = true

  subnets = [
    data.aws_subnet.ccs_api_gateway_reverse_proxy_eu_west_2a_subnet.id,
    data.aws_subnet.ccs_api_gateway_reverse_proxy_eu_west_2b_subnet.id,
    data.aws_subnet.ccs_api_gateway_reverse_proxy_eu_west_2c_subnet.id
  ]
}

resource "aws_lb_listener" "ccs_api_gateway_reverse_proxy_nlb_listener" {
  load_balancer_arn = aws_lb.ccs_api_gateway_reverse_proxy_nlb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ccs_api_gateway_reverse_proxy_target_group.arn
  }
}
