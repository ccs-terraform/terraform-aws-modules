resource "aws_iam_role" "ccs_api_gateway_lambda_iam_role" {
  name = var.ccs_api_gateway_lambda_iam_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "ccs_api_gateway_lambda_get_function_policy" {
  name = "ccs_api_gateway_lambda_get_function_policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "lambda:GetFunction"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_lambda_iam_role_storage_gateway_read_only_access" {
  policy_arn = "arn:aws:iam::aws:policy/AWSStorageGatewayReadOnlyAccess"
  role       = aws_iam_role.ccs_api_gateway_lambda_iam_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_lambda_iam_role_api_gateway_invoke_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayInvokeFullAccess"
  role       = aws_iam_role.ccs_api_gateway_lambda_iam_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_lambda_iam_role_api_gateway_push_logs_to_cloudwatch" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
  role       = aws_iam_role.ccs_api_gateway_lambda_iam_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_lambda_iam_role_api_gateway_administrator" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
  role       = aws_iam_role.ccs_api_gateway_lambda_iam_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_lambda_get_function" {
  role       = aws_iam_role.ccs_api_gateway_lambda_iam_role.name
  policy_arn = aws_iam_policy.ccs_api_gateway_lambda_get_function_policy.arn
}

### MFA Configuration
resource "aws_iam_policy" "mfa_manage_own_device" {
  name = var.mfa_manage_own_device_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Sid : "AllowManageOwnVirtualMFADevice",
        Effect : "Allow",
        Action : [
          "iam:DeleteVirtualMFADevice",
          "iam:CreateVirtualMFADevice"
        ],
        Resource : "arn:aws:iam::*:mfa/$${aws:username}"
      },
      {
        Sid : "AllowManageOwnUserMFA",
        Effect : "Allow",
        Action : [
          "iam:ResyncMFADevice",
          "iam:ListMFADevices",
          "iam:EnableMFADevice",
          "iam:DeactivateMFADevice"
        ],
        Resource : "arn:aws:iam::*:user/$${aws:username}"
      }
    ]
  })
}

resource "aws_iam_group" "mfa_manage_own_device" {
  name = var.mfa_manage_own_device_iam_group_name
}

resource "aws_iam_group_policy_attachment" "mfa_manage_own_device" {
  group      = aws_iam_group.mfa_manage_own_device.id
  policy_arn = aws_iam_policy.mfa_manage_own_device.arn
}

resource "aws_iam_account_password_policy" "iam_account_password_policy" {
  allow_users_to_change_password = true
  minimum_password_length        = 14
  password_reuse_prevention      = 5
  require_lowercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  require_uppercase_characters   = true
}

resource "aws_iam_group" "cloudwatch_read_only_group" {
  name = var.cloudwatch_read_only_group
}

resource "aws_iam_group_policy_attachment" "cloudwatch_read_only_group" {
  group      = aws_iam_group.cloudwatch_read_only_group.id
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}

resource "aws_iam_group" "iam_change_password_group" {
  name = var.iam_change_password_group
}

resource "aws_iam_group_policy_attachment" "iam_change_password_group" {
  group      = aws_iam_group.iam_change_password_group.id
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

### Cloud Engineers
resource "aws_iam_group" "ccs_cloud_engineers_group" {
  name = var.iam_ccs_cloud_engineers_group
}

resource "aws_iam_policy" "ccs_cloud_engineers_admin_with_mfa" {
  name = var.iam_ccs_cloud_engineers_admin_with_mfa_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Effect : "Allow",
        Action : "*",
        Resource : "*",
        Condition : {
          "Bool" : {
            "aws:MultiFactorAuthPresent" : "true"
          }
        }
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "ccs_cloud_engineers_admin_access_with_mfa" {
  group      = aws_iam_group.ccs_cloud_engineers_group.id
  policy_arn = aws_iam_policy.ccs_cloud_engineers_admin_with_mfa.arn
}

resource "aws_iam_role" "Techops_Jenkins_Role" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action    = "sts:AssumeRole"
          Condition = {}
          Effect    = "Allow"
          Principal = {
            AWS = "arn:aws:iam::473251818902:root"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::${data.aws_caller_identity.account_id.id}:policy/packer-policy",
    "arn:aws:iam::aws:policy/IAMFullAccess",
  ]
  max_session_duration = 3600
  name                 = "Techops_Jenkins_Role"
  path                 = "/"
}

resource "aws_iam_role" "ccs_api_gateway_reverse_proxy_eu_west_2a_role" {
  name               = "${var.ccs_api_gateway_reverse_proxy_eu_west_2a_component_name}_role"
  assume_role_policy = data.aws_iam_policy_document.ccs_api_gateway_reverse_proxy_iam_policy.json
}

resource "aws_iam_role" "ccs_api_gateway_reverse_proxy_eu_west_2b_role" {
  name               = "${var.ccs_api_gateway_reverse_proxy_eu_west_2b_component_name}_role"
  assume_role_policy = data.aws_iam_policy_document.ccs_api_gateway_reverse_proxy_iam_policy.json
}

resource "aws_iam_role" "ccs_api_gateway_reverse_proxy_eu_west_2c_role" {
  name               = "${var.ccs_api_gateway_reverse_proxy_eu_west_2c_component_name}_role"
  assume_role_policy = data.aws_iam_policy_document.ccs_api_gateway_reverse_proxy_iam_policy.json
}

resource "aws_iam_role" "ccs_api_gateway_reverse_proxy_bastion_role" {
  name               = "${var.ccs_api_gateway_reverse_proxy_bastion_component_name}_role"
  assume_role_policy = data.aws_iam_policy_document.ccs_api_gateway_reverse_proxy_iam_policy.json
}

resource "aws_iam_instance_profile" "ccs_api_gateway_reverse_proxy_eu_west_2a_profile" {
  name = "${var.ccs_api_gateway_reverse_proxy_eu_west_2a_component_name}_instance_profile"
  role = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2a_role.name
}

resource "aws_iam_instance_profile" "ccs_api_gateway_reverse_proxy_eu_west_2b_profile" {
  name = "${var.ccs_api_gateway_reverse_proxy_eu_west_2b_component_name}_instance_profile"
  role = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2b_role.name
}

resource "aws_iam_instance_profile" "ccs_api_gateway_reverse_proxy_eu_west_2c_profile" {
  name = "${var.ccs_api_gateway_reverse_proxy_eu_west_2c_component_name}_instance_profile"
  role = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2c_role.name
}

resource "aws_iam_instance_profile" "ccs_api_gateway_reverse_proxy_bastion_profile" {
  name = "${var.ccs_api_gateway_reverse_proxy_bastion_component_name}_instance_profile"
  role = aws_iam_role.ccs_api_gateway_reverse_proxy_bastion_role.name
}

resource "aws_iam_policy" "ccs_api_gateway_update_launch_template_policy" {
  name   = "jenkins_update_launch_template_policy"
  policy = data.aws_iam_policy_document.ccs_api_gateway_launch_template_update_policy.json
}

resource "aws_iam_policy" "ccs_api_gateway_kms_jenkins_policy" {
  name   = "jenkins_kms_policy"
  policy = data.aws_iam_policy_document.ccs_api_gateway_kms_jenkins_policy.json
}

resource "aws_iam_policy" "ccs_api_gateway_reverse_proxy_to_cloudwatch_logs" {
  name   = "ccs_api_gateway_reverse_proxy_to_cloudwatch_logs"
  policy = data.aws_iam_policy_document.ccs_api_gateway_reverse_proxy_to_cloudwatch_logs_policy.json
}

resource "aws_iam_policy" "ccs_api_gateway_reverse_proxy_s3_bucket_policy" {
  name   = "ccs_api_gateway_reverse_proxy_s3_bucket_policy"
  policy = data.aws_iam_policy_document.ccs_api_gateway_reverse_proxy_s3_bucket_policy.json
}

resource "aws_iam_policy" "ccs_api_gateway_reverse_proxy_secrets_manager_policy" {
  name   = "ccs_api_gateway_reverse_proxy_secrets_manager_policy"
  policy = data.aws_iam_policy_document.ccs_api_gateway_reverse_proxy_secrets_manager_policy.json
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_jenkins_update_launch_template" {
  policy_arn = aws_iam_policy.ccs_api_gateway_update_launch_template_policy.arn
  role       = aws_iam_role.Techops_Jenkins_Role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_jenkins_kms" {
  policy_arn = aws_iam_policy.ccs_api_gateway_kms_jenkins_policy.arn
  role       = aws_iam_role.Techops_Jenkins_Role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_eu_west_2a_to_cloudwatch_logs" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_to_cloudwatch_logs.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2a_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_eu_west_2b_to_cloudwatch_logs" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_to_cloudwatch_logs.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2b_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_eu_west_2c_to_cloudwatch_logs" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_to_cloudwatch_logs.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2c_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_bastion_to_cloudwatch_logs" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_to_cloudwatch_logs.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_bastion_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_eu_west_2a_s3_bucket_policy" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_s3_bucket_policy.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2a_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_eu_west_2b_s3_bucket_policy" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_s3_bucket_policy.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2b_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_eu_west_2c_s3_bucket_policy" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_s3_bucket_policy.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2c_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_bastion_s3_bucket_policy" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_s3_bucket_policy.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_bastion_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_eu_west_2a_secrets_manager_policy" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_secrets_manager_policy.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2a_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_eu_west_2b_secrets_manager_policy" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_secrets_manager_policy.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2b_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_eu_west_2c_secrets_manager_policy" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_secrets_manager_policy.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_eu_west_2c_role.name
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_bastion_secrets_manager_policy" {
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_secrets_manager_policy.arn
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_bastion_role.name
}
