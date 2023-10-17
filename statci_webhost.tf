resource "aws_s3_bucket_website_configuration" "codekalam_web_host" {
  bucket = aws_s3_bucket.codekalam_example.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}