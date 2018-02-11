resource "aws_dynamodb_table" "emr_kinesis_dynamodb_table" {
  name           = "EMR-Kinesis"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "HashKey"
  range_key      = "RangeKey"

  attribute {
    name = "HashKey"
    type = "S"
  }

  attribute {
    name = "RangeKey"
    type = "S"
  }

  tags {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
