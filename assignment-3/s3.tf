resource "aws_s3_bucket" "log_bucket" {
  bucket = var.s3_bucket_name

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "log_lifecycle" {
  bucket = aws_s3_bucket.log_bucket.id

  rule {
    id     = "ExpireLogs"
    status = "Enabled"

    expiration {
      days = 7
    }

    filter {
      prefix = "app/logs/"
    }
  }
}

