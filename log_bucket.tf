resource "aws_s3_bucket" "codekalam_log_example" {
  bucket = "my-logs-bucket-codekalam"
}



resource "aws_s3_bucket_logging" "codekalam_loging" {
  bucket = aws_s3_bucket.codekalam_example.id

  target_bucket = aws_s3_bucket.codekalam_log_example.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_policy" "codekalam_log_policy" {
  bucket = aws_s3_bucket.codekalam_log_example.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Putobject"
        ]
        Effect   = "Allow"
        Resource = [ 
            "${aws_s3_bucket.codekalam_log_example.arn}/*"
        ]
        Principal = {
            Service = "logging.s3.amazonaws.com"
        }
      },
    ]
  })
}
