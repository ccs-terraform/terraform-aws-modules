data "aws_caller_identity" "account_id" {}

data "aws_iam_policy_document" "ccs_api_gateway_reverse_proxy_iam_policy" {
  version = "2012-10-17"
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["ec2.amazonaws.com"]
      type        = "Service"
    }

    effect = "Allow"
  }
}

data "aws_iam_policy_document" "ccs_api_gateway_reverse_proxy_to_cloudwatch_logs_policy" {
  version = "2012-10-17"
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams"
    ]

    effect = "Allow"

    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }
}

data "aws_iam_policy_document" "ccs_api_gateway_reverse_proxy_s3_bucket_policy" {
  version = "2012-10-17"
  statement {
    sid = ""
    actions = [
      "s3:GetObject"
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::${var.reverse_proxy_config_s3_bucket_name}/*"
    ]
  }

  statement {
    sid = ""
    actions = [
      "s3:ListBucket"
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::${var.reverse_proxy_config_s3_bucket_name}"
    ]
  }
  statement {
    sid = ""
    actions = [
      "s3:ListBucketVersions"
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::${var.reverse_proxy_config_s3_bucket_name}",
      "arn:aws:s3:::${var.reverse_proxy_config_s3_bucket_name}/*"
    ]
  }
  statement {
    sid = ""
    actions = [
      "s3:GetObjectVersion"
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::${var.reverse_proxy_config_s3_bucket_name}/*"
    ]
  }
}

data "aws_iam_policy_document" "ccs_api_gateway_reverse_proxy_secrets_manager_policy" {
  version = "2012-10-17"
  statement {
    sid = ""
    actions = [
      "secretsmanager:GetSecretValue"
    ]

    effect = "Allow"

    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "ccs_api_gateway_launch_template_update_policy" {
  statement {
    sid    = "JenkinsRoleLaunchTemplateUpdatePermissions"
    effect = "Allow"
    actions = [
      "ec2:GetLaunchTemplateData",
      "ec2:ModifyLaunchTemplate",
      "ec2:CreateLaunchTemplateVersion",
      "ec2:Describe*",
      "ec2:Get*",
      "ec2:List*",
      "autoscaling:Describe*",
      "autoscaling:UpdateAutoScalingGroup",
      "elasticloadbalancing:Describe*"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "ccs_api_gateway_kms_jenkins_policy" {
  statement {
    sid    = "JenkinsRoleKMSPermissions"
    effect = "Allow"
    actions = [
      "kms:*"
    ]

    resources = [
      "arn:aws:kms:eu-west-2:${data.aws_caller_identity.account_id.account_id}:alias/${var.environment}-api-gateway-ebs-kms-key"
    ]
  }
}
