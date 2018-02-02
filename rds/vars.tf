variable "region" {
    description = "The AWS Region"
    default     = "us-west-2"
}

variable "environment" {
    description = "Environment"
    default     = "dev"
}

variable "instance_type" {
    description = "The RDS instance type"
    default     = "db.t2.micro"
}

variable "engine" {
    description = "The RDS DB Type (MySQL, Postgresql, etc.)"
    default     = "postgresql"
}

variable "engine_version" {
    description = "The version number for the engine type"
    default     = "9.6.3"
}

variable "parameter_group_family" {
    description = "The parameter group family"
    default     = "postgres9.6"
}

variable "maintenance_window" {
    description = "The specified window for maintenance operations"
    default     = "Sat:00:00-Sat:03:00"
}

variable "backup_window" {
    description = "The specific window for backups"
    default     = "03:00-06:00"
}

variable "port" {
    description = "The RDS DB Port"
    default     = "5432"
}

variable "s3_terraform_bucket" {
    description = "S3 Remote State Storage Bucket"
    default     = "gloo-poc"
}

variable "s3_bucket_region" {
    description = "S3 Remote State Storage Bucket Region"
    default     = "us-west-2"
}
