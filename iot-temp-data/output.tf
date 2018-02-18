output "kinesis_stream_name" {
  value = "${aws_kinesis_stream.kinesis_stream_raw_temp_data.name}"
}
