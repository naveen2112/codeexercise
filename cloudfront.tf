resource "aws_cloudfront_distribution" "codekalam_s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.codekalam_example.bucket_regional_domain_name
    origin_id                = "s3origin"
  }

  enabled             = true
  comment             = "Some comment"
  default_root_object = "index.html"


  aliases = ["codekalam.samplenaveen.in"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3origin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }



  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }


  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:208692741524:certificate/033f630b-4f4c-4b27-839f-43e04d1fb12c"
    ssl_support_method = "sni-only"
  }
}