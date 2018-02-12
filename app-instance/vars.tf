variable "region" {
    description = "The AWS Region"
    default     = "us-west-2"
}

variable "environment" {
    description = "Environment"
    default     = "dev"
}

variable "instance_type" {
    description = "EC2 Instance Type to use in launch configuration"
    default     = "t2.micro"
}

variable "role" {
    description = "Application role to pull AMI dynamically"
    default     = "nginx-app"
}

variable "s3_terraform_bucket" {
    description = "S3 Remote State Storage Bucket"
    default     = "gloo-poc"
}

variable "s3_bucket_region" {
    description = "S3 Remote State Storage Bucket Region"
    default     = "us-west-2"
}
