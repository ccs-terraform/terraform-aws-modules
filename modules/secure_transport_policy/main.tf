data "aws_iam_policy_document" "secure_transport_policy" {
  statement {
    effect = "Deny"

    principals {
      identifiers = ["*"]
      type        = "*"
    }

    actions = [
      "s3:*",
    ]

    condition {
      test = "Bool"

      values = [
        "false",
      ]

      variable = "aws:SecureTransport"
    }

    resources = [
      "${var.s3_bucket_arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = var.s3_bucket
  policy = data.aws_iam_policy_document.secure_transport_policy.json
}
