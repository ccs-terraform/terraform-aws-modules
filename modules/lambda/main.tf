resource "aws_lambda_function" "ccs_api_gateway_reverse_proxy_lambda" {
  s3_bucket         = data.aws_s3_bucket.ccs_api_gateway_reverse_proxy_lambda_s3_bucket.bucket
  s3_key            = data.aws_s3_bucket_object.ccs_api_gateway_reverse_proxy_refresh_function.key
  s3_object_version = data.aws_s3_bucket_object.ccs_api_gateway_reverse_proxy_refresh_function.version_id
  function_name     = var.ccs_api_gateway_reverse_proxy_lambda_function_name
  role              = aws_iam_role.ccs_api_gateway_reverse_proxy_iam_role.arn
  runtime           = "python3.8"
  kms_key_arn       = data.aws_kms_key.key_alias.arn
  handler           = var.ccs_api_gateway_reverse_proxy_lambda_handler
  architectures     = ["x86_64"]
  memory_size       = "500"
  timeout           = "360"
  publish           = true

  environment {
    variables = {
      AUTOSCALING_GROUPS = jsonencode(["ccs_api_gateway_reverse_proxy_eu_west_2a_asg", "ccs_api_gateway_reverse_proxy_eu_west_2b_asg", "ccs_api_gateway_reverse_proxy_eu_west_2c_asg"])
    }
  }
}

resource "aws_lambda_permission" "allow_invocations_reverse_proxy_refresh_lambda" {
  statement_id  = var.statement_id
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ccs_api_gateway_reverse_proxy_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.reverse_proxy_refresh_cloudwatch_event_rule.arn
}

resource "aws_cloudwatch_event_rule" "reverse_proxy_refresh_cloudwatch_event_rule" {
  description         = var.description
  is_enabled          = true
  name                = var.reverse_proxy_event_rule_name
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "reverse_proxy_refresh_lambda_target" {
  arn  = aws_lambda_function.ccs_api_gateway_reverse_proxy_lambda.arn
  rule = aws_cloudwatch_event_rule.reverse_proxy_refresh_cloudwatch_event_rule.id
}

resource "aws_iam_role" "ccs_api_gateway_reverse_proxy_iam_role" {
  name = var.ccs_api_gateway_reverse_proxy_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}
resource "aws_iam_policy" "ccs_api_gateway_reverse_proxy_lambda_logging" {
  name = var.ccs_api_gateway_reverse_proxy_lambda_logging_policy_name
  path = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}


resource "aws_iam_policy" "ccs_api_gateway_reverse_proxy_lambda_ec2" {
  name = var.ccs_api_gateway_reverse_proxy_lambda_ec2_policy_name
  path = "/"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "autoscaling:UpdateAutoScalingGroup",
              "autoscaling:TerminateInstanceInAutoScalingGroup",
              "autoscaling:SetDesiredCapacity",
              "autoscaling:PutScalingPolicy"
            ],
            "Resource": "*"
        },
        {
          "Effect": "Allow",
          "Action": [
            "cloudwatch:DescribeAlarms"
          ],
          "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
                        "autoscaling.amazonaws.com",
                        "ec2scheduled.amazonaws.com"
                    ]
                }
            }
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_lambda_logging" {
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_iam_role.name
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_lambda_logging.arn
}

resource "aws_iam_role_policy_attachment" "ccs_api_gateway_reverse_proxy_lambda_ec2" {
  role       = aws_iam_role.ccs_api_gateway_reverse_proxy_iam_role.name
  policy_arn = aws_iam_policy.ccs_api_gateway_reverse_proxy_lambda_ec2.arn
}
