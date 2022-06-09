data "aws_iam_policy_document" "ccs_api_gateway_sns_policy" {
  policy_id = "__default_policy_ID"
  version   = "2012-10-17"

  statement {
    sid = "__default_statement_ID"
    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive",
    ]

    condition {
      test     = "StringEquals"
      values   = [var.aws_account_id]
      variable = "AWS:SourceOwner"
    }
    effect = "Allow"

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = ["arn:aws:sns:${var.region}:${var.aws_account_id}:${var.sns_topic_name}"]
  }

  statement {
    actions = ["sns:Publish"]
    effect  = "Allow"

    principals {
      identifiers = ["cloudwatch.amazonaws.com"]
      type        = "Service"
    }

    resources = ["arn:aws:sns:${var.region}:${var.aws_account_id}:${var.sns_topic_name}"]
    sid       = "Allow_Publish_Alarms"
  }

  statement {
    actions = ["sns:Publish"]
    effect  = "Allow"

    principals {
      identifiers = ["events.amazonaws.com"]
      type        = "Service"
    }

    resources = ["arn:aws:sns:${var.region}:${var.aws_account_id}:${var.sns_topic_name}"]
  }
}
