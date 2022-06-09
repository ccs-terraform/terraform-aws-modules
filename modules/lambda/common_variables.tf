variable "environment" {
  type = string
}

variable "ccs_api_gateway_reverse_proxy_lambda_function_name" {
  type    = string
  default = "reverse_proxy_refresh"
}

variable "ccs_api_gateway_reverse_proxy_bucket_name" {
  type    = string
  default = "ccs-api-gateway-reverse-proxy-lambda-config"
}

variable "ccs_api_gateway_reverse_proxy_s3_key" {
  type    = string
  default = "reverse_proxy_refresh.zip"
}

variable "ccs_api_gateway_reverse_proxy_lambda_logging_policy_name" {
  type    = string
  default = "ccs-api_gateway-reverse-proxy-lambda-logging"
}

variable "ccs_api_gateway_reverse_proxy_lambda_ec2_policy_name" {
  type    = string
  default = "ccs-api-gateway-reverse-proxy-lambda-ec2"
}

variable "ccs_api_gateway_reverse_proxy_lambda_handler" {
  type    = string
  default = "reverse_proxy_refresh.lambda_handler"
}

variable "ccs_api_gateway_reverse_proxy_lambda_iam_role_name" {
  type    = string
  default = "ccs-api-gateway-reverse-proxy-lambda-role"
}

variable "description" {
  type    = string
  default = "Lambda Events Rule for triggering the reverse_proxy_refresh function"
}
variable "reverse_proxy_event_rule_name" {
  type    = string
  default = "LambdaReverseProxyRefreshEventRule"
}

variable "schedule_expression" {
  type    = string
  default = "cron(00 00 * * ? *)"
}

variable "statement_id" {
  type    = string
  default = "AllowExecutionFromEventBridge"
}
