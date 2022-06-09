data "aws_s3_bucket" "ccs_api_gateway_reverse_proxy_lambda_s3_bucket" {
  bucket = "${var.ccs_api_gateway_reverse_proxy_bucket_name}-${var.environment}"
}

data "aws_s3_bucket_object" "ccs_api_gateway_reverse_proxy_refresh_function" {
  bucket = "${var.ccs_api_gateway_reverse_proxy_bucket_name}-${var.environment}"
  key    = var.ccs_api_gateway_reverse_proxy_s3_key
}

data "aws_kms_key" "key_alias" {
  key_id = "alias/aws/lambda"
}
