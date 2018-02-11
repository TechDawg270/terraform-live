variable "region" {
    description = "The AWS Region"
    default     = "us-west-2"
}

variable "environment" {
    description = "Environment"
    default     = "dev"
}

variable "release_label" {
    description = "The release label for the Amazon EMR release"
    default     = "emr-4.6.0"
}

variable "applications" {
    description = "A list of applications for the cluster. Valid values are: Flink, Hadoop, Hive, Mahout, Pig, and Spark. Case insensitive"
    default     = ["Spark","Hive"]
}

variable "ebs_root_volume_size" {
    description = "Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance"
    default     = 100
}

variable "master_instance_type" {
    description = "The EC2 instance type of the master node"
    default     = "m1.medium"
}

variable "core_instance_type" {
    description = "The EC2 instance type of the slave nodes"
    default     = "m1.medium"
}

variable "core_instance_count" {
    description = "Number of Amazon EC2 instances used to execute the job flow. EMR will use one node as the cluster's master node and use the remainder of the nodes"
    default     = 2
}

variable "s3_terraform_bucket" {
    description = "S3 Remote State Storage Bucket"
    default     = "gloo-poc"
}

variable "s3_bucket_region" {
    description = "S3 Remote State Storage Bucket Region"
    default     = "us-west-2"
}
