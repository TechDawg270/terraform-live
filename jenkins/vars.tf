variable "region" {
    description = "The AWS Region"
    default     = "us-west-2"
}

variable "environment" {
    description = "Environment"
    default     = "dev"
}

variable "instance_device_name" {
  description = "Template variable used for block device mapping"
  default     = "/dev/xvdh"
}

variable "jenkins_version" {
  description = "The version of Jenkins to install and maintain"
  default     = "2.108.1"
}

variable "master_instance_type" {
  description = "The EC2 instance type for the Jenkins master server"
  default     = "t2.medium"
}

variable "s3_terraform_bucket" {
    description = "S3 Remote State Storage Bucket"
    default     = "gloo-poc"
}

variable "s3_bucket_region" {
    description = "S3 Remote State Storage Bucket Region"
    default     = "us-west-2"
}

variable "key_name" {
    description = "The key name to use for the instance"
    default     = "devops_infra_mgmt"
}
