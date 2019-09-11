resource "aws_s3_bucket" "alb_log" {
  bucket = "alb-log-pragmatic-terraform-on-aws-me"

  lifecycle_rule {
      enabled = true

      expiration {
          days = "180"
      }
  }
}
