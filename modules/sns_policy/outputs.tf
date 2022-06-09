output "sns_policy" {
  value = data.aws_iam_policy_document.ccs_api_gateway_sns_policy.json
}
