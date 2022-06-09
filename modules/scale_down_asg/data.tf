data "aws_autoscaling_group" "ccs_api_gateway_reverse_proxy_bastion_asg" {
  name = "ccs_api_gateway_reverse_proxy_bastion_asg"
}

data "aws_autoscaling_group" "ccs_api_gateway_reverse_proxy_eu_west_2a_asg" {
  name = "ccs_api_gateway_reverse_proxy_eu_west_2a_asg"
}

data "aws_autoscaling_group" "ccs_api_gateway_reverse_proxy_eu_west_2b_asg" {
  name = "ccs_api_gateway_reverse_proxy_eu_west_2b_asg"
}

data "aws_autoscaling_group" "ccs_api_gateway_reverse_proxy_eu_west_2c_asg" {
  name = "ccs_api_gateway_reverse_proxy_eu_west_2c_asg"
}
