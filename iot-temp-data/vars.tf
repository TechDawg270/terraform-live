variable "region" {
    description = "The AWS Region"
    default     = "us-west-2"
}

variable "environment" {
    description = "Environment"
    default     = "dev"
}

variable "retention_period" {
    description = "The time period from when a record is added to when it is no longer accessible"
    default     = 48 # AWS default if not specified
}


variable "s3_terraform_bucket" {
    description = "S3 Remote State Storage Bucket"
    default     = "gloo-poc"
}

variable "s3_bucket_region" {
    description = "S3 Remote State Storage Bucket Region"
    default     = "us-west-2"
}
