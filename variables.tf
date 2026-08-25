variable "aws_region" {
  description = "AWS region in which to create the infrastructure."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique name for the private S3 bucket."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "bucket_name must be a valid S3 bucket name between 3 and 63 characters."
  }
}

variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
  default     = "dev"
}

variable "force_destroy" {
  description = "Allow Terraform to delete a non-empty bucket. Keep false outside of disposable environments."
  type        = bool
  default     = false
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "admin_cidr" {
  description = "CIDR block allowed to connect to the EC2 instance over SSH."
  type        = string
  default     = "127.0.0.1/32"
}

variable "tags" {
  description = "Tags applied to supported AWS resources."
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
    Project   = "aws-infrastructure-terraform"
  }
}