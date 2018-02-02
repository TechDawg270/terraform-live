output "instance_name" {
  value = "${module.db.this_db_instance_name}"
}

output "port" {
  value = "${module.db.this_db_instance_port}"
}

output "instance_id" {
  value = "${module.db.this_db_instance_id}"
}

output "az" {
  value = "${module.db.this_db_instance_availability_zone}"
}

output "address" {
  value = "${module.db.this_db_instance_address}"
}
