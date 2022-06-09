output "instance_profile_2a" {
  value = aws_iam_instance_profile.ccs_api_gateway_reverse_proxy_eu_west_2a_profile.arn
}

output "instance_profile_2b" {
  value = aws_iam_instance_profile.ccs_api_gateway_reverse_proxy_eu_west_2b_profile.arn
}

output "instance_profile_2c" {
  value = aws_iam_instance_profile.ccs_api_gateway_reverse_proxy_eu_west_2c_profile.arn
}

output "instance_profile_bastion" {
  value = aws_iam_instance_profile.ccs_api_gateway_reverse_proxy_bastion_profile.arn
}
