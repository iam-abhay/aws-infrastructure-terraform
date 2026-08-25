# aws-infrastructure-terraform

Terraform configuration for a private, encrypted, versioned Amazon S3 bucket and a least-privilege IAM role that can access it.

## Prerequisites

- Terraform 1.5 or later
- AWS credentials configured for the target account

## Usage

1. Set a globally unique S3 bucket name in `terraform.tfvars`.
2. Initialize Terraform:

	```powershell
	terraform init
	```

3. Review the planned changes:

	```powershell
	terraform plan
	```

4. Apply the configuration:

	```powershell
	terraform apply
	```

The bucket blocks public access, enables versioning, and uses AES-256 server-side encryption. Keep `force_destroy = false` unless the bucket is disposable.
