variable "subnet_id" {
  description = "Id of the VPC subnet"
}

variable "ssh_key_name" {
  description = "ssh key to login"
}

variable "vpc_security_group_ids_csv" {
  description = "sec group id as csv"
}

variable "role" {
  description = "Instance Role (front end, api, data layer)"
  default     = ""
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = ""
}

variable "environment" {
  description = "Environment this instance belongs to (dev, int, stage, prod, demo)"
}

variable "project" {
  description = "Project (useful for specific billing reports related to project costing"
}

variable "count" {
  description = "Default number of instances to launch (will span multiple AZs if > 1)"
  default     = 1
}
