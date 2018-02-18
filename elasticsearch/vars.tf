variable "region" {
    description = "The AWS Region"
    default     = "us-west-2"
}

variable "environment" {
    description = "Environment"
    default     = "dev"
}

variable "es_version" {
    description = "The version of ElasticSearch to deploy"
    default     = "5.5"
}

variable "cluster_instance_count" {
    description = "Instance count of data nodes in the cluster"
    default     = 1
}

variable "cluster_instance_type" {
    description = "Instance type of data nodes in the cluster"
    default     = "t2.medium.elasticsearch"
}

variable "enable_dedicated_master" {
    description = " Indicates whether dedicated master nodes are enabled for the cluster" #minimum 3 for prod
    default     = false
}

variable "enable_zone_awareness" {
    description = "Indicates whether zone awareness is enabled (multi-az)" # should be set to true with greater instance count for prod
    default     = false
}
