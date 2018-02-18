output "kibana_endpoint" {
	value = "${aws_elasticsearch_domain.es_domain.kibana_endpoint}"
}
