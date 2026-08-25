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

output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = aws_subnet.public.id
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.web.id
}

output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance."
  value       = aws_instance.web.public_ip
}