output "s3_bucket_name" {
  description = "Name of the private S3 bucket."
  value       = aws_s3_bucket.private.id
}

output "s3_bucket_arn" {
  description = "ARN of the private S3 bucket."
  value       = aws_s3_bucket.private.arn
}

output "s3_access_role_arn" {
  description = "ARN of the IAM role with access to the S3 bucket."
  value       = aws_iam_role.s3_access.arn
}