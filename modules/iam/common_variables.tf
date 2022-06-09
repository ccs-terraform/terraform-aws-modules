variable "cloudwatch_read_only_group" {
  default = "CCS_CloudWatch_ReadOnly_Access"
}

variable "ccs_api_gateway_lambda_iam_role_name" {
  default = "ccs-api-gateway-lambda-role"
}

variable "iam_ccs_cloud_engineers_group" {
  default = "CCS_Cloud_Engineers"
}

variable "iam_ccs_cloud_engineers_admin_with_mfa_policy_name" {
  default = "CCS_Cloud_Engineers_Admin_With_MFA"
}

variable "iam_change_password_group" {
  default = "CCS_IAM_User_Change_Password"
}

variable "mfa_manage_own_device_iam_group_name" {
  default = "CCS_MFA_ManageOwnDevice"
}

variable "mfa_manage_own_device_iam_policy_name" {
  default = "CCS_manageown_mfa_device"
}

variable "reverse_proxy_config_s3_bucket_name" {}

variable "environment" {}

variable "ccs_api_gateway_reverse_proxy_eu_west_2a_component_name" {
  default = "ccs_api_gateway_reverse_proxy_eu_west_2a"
}

variable "ccs_api_gateway_reverse_proxy_eu_west_2b_component_name" {
  default = "ccs_api_gateway_reverse_proxy_eu_west_2b"
}

variable "ccs_api_gateway_reverse_proxy_eu_west_2c_component_name" {
  default = "ccs_api_gateway_reverse_proxy_eu_west_2c"
}

variable "ccs_api_gateway_reverse_proxy_bastion_component_name" {
  default = "ccs_api_gateway_reverse_proxy"
}
