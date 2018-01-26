data "aws_region" "current" {
  current = true
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.name}"
  acl    = "private"

  tags {
    Name = "${var.name}"
  }

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "this" {
  name           = "${var.name}-lock-table"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "${var.name}-lock-table"
  }
}
