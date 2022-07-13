resource "aws_kms_key" "api_gateway_ebs_kms_key" {
  description              = var.description
  deletion_window_in_days  = var.deletion_window
  key_usage                = var.key_usage
  policy                   = var.policy
  is_enabled               = var.enabled
  customer_master_key_spec = var.key_spec
}

resource "aws_kms_alias" "api_gateway_ebs_kms_key_alias" {
  name          = "alias/${var.environment}-api-gateway-ebs-kms-key"
  target_key_id = aws_kms_key.api_gateway_ebs_kms_key.id
}
