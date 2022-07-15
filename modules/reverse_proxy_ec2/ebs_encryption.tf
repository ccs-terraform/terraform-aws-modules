resource "aws_ebs_encryption_by_default" "ccs_api_gateway_ec2_ebs_encryption_by_default" {
  enabled = true
}

resource "aws_ebs_default_kms_key" "ebs_kms_key" {
  key_arn = var.key_arn
}
