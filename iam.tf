data "aws_iam_policy_document" "s3_access_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

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

resource "aws_iam_instance_profile" "ec2" {
  name = "${local.name_prefix}-ec2-profile"
  role = aws_iam_role.s3_access.name
}