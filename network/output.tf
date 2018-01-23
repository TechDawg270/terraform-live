output "vpc_id" {
	description = "The ID of the VPC"
	value		= "${module.vpc.vpc_id}"
}

output "vpc_public_subnets" {
	description = "The public subnets of the VPC"
	value		= "${module.vpc.public_subnets}"
}

output "vpc_private_subnets" {
	description = "The private subnets of the VPC"
	value		= "${module.vpc.private_subnets}"
}
