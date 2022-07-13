output "ebs_kms_key_arn" {
  value = aws_kms_key.api_gateway_ebs_kms_key.arn
}
