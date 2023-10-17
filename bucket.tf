resource "aws_s3_bucket" "codekalam_example" {
  bucket = "my-devops-internship-bucket"
}

resource "aws_s3_bucket_versioning" "codekalam_versioning_example" {
  bucket = aws_s3_bucket.codekalam_example.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_public_access_block" "codekalam_public_access_block" {
  bucket = aws_s3_bucket.codekalam_example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "codekalam_bucketpolicy" {
  bucket = aws_s3_bucket.codekalam_example.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Getobject"
        ]
        Effect   = "Allow"
        Resource = [ 
            "${aws_s3_bucket.codekalam_example.arn}/*"
        ]
        Principal = "*"
      },
    ]
  })
}

resource "aws_s3_object" "index_object" {
  bucket = aws_s3_bucket.codekalam_example.id
  key    = "index.html"
  source = "C:/Users/DELL/Desktop/CODEKALAM/Bucket/index.html"
  content_type = "text/html"

}

resource "aws_s3_object" "error_object" {
  bucket = aws_s3_bucket.codekalam_example.id
  key    = "error.html"
  source = "C:/Users/DELL/Desktop/CODEKALAM/Bucket/error.html"
  content_type = "text/html"
}