variable "aws_region" {
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
