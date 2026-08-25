data "aws_iam_policy_document" "s3_access_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3_access" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.private.arn]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = ["${aws_s3_bucket.private.arn}/*"]
  }
}

resource "aws_iam_role" "s3_access" {
  name               = "${local.name_prefix}-s3-access"
  assume_role_policy = data.aws_iam_policy_document.s3_access_assume_role.json
}

resource "aws_iam_role_policy" "s3_access" {
  name   = "${local.name_prefix}-s3-policy"
  role   = aws_iam_role.s3_access.id
  policy = data.aws_iam_policy_document.s3_access.json
}