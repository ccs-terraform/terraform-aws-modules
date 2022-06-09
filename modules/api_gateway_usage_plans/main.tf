resource "aws_api_gateway_api_key" "api_key" {
  name = var.api_key_name
}

resource "aws_api_gateway_usage_plan" "usage_plan" {
  name = var.usage_plan_name

  api_stages {
    api_id  = var.api_gateway_rest_api_id
    stage   = var.api_gateway_stage_name
  }
}

resource "aws_api_gateway_usage_plan_key" "usage_plan_key" {
  key_id          = aws_api_gateway_api_key.api_key.id
  key_type        = "API_KEY"
  usage_plan_id   = aws_api_gateway_usage_plan.usage_plan.id
}
