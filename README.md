# aws-infrastructure-terraform

Terraform configuration for a simple AWS environment: a public subnet in a VPC, an EC2 instance with an IAM instance profile, and a private encrypted S3 bucket.

## Prerequisites

- Terraform 1.5 or later
- AWS credentials configured for the target account

## Usage

1. Set a globally unique S3 bucket name and administrator CIDR in `terraform.tfvars`.
2. Format, initialize, and validate the configuration:

	```powershell
	terraform fmt
	terraform init
	terraform validate
	```

3. Review the planned changes before applying:

	```powershell
	terraform plan
	```

4. Apply the configuration:

	```powershell
	terraform apply
	```

The bucket blocks public access, enables versioning, and uses AES-256 server-side encryption. The EC2 instance uses the Amazon Linux 2023 AMI and receives only the S3 permissions defined in the IAM policy. Keep `force_destroy = false` unless the bucket is disposable.
