output "bucket_arn" {
  description = "The ARN for bucket"
  value		  = "${aws_s3_bucket.this.arn}"
}

output "dynamodb_table" {
  description = "The DynamoDB Table"
  value		  = "${aws_dynamodb_table.this.name}"
}
