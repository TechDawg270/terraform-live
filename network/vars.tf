variable "region" {
    description = "The AWS Region"
    default     = "us-west-2"
}

variable "environment" {
    description = "Environment"
    default     = "dev"
}

variable "access_ips" {
  description = "IPs to allow ingress traffic from such as home/office public ip"
  type        = "list"
  default     = ["0.0.0.0/0"]
}
