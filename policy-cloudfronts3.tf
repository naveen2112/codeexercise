resource "aws_iam_policy" "codekalam_policy" {
  name        = "test_policy"


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "cloudfront:CreateDistribution",
          "cloudfront:CreateFunction",
		  "cloudfront:CreateInvalidation",
		  "cloudfront:CreateCachePolicy",
		  "cloudfront:ListFunctions",
		  "cloudfront:ListDistributions",
          "s3:GetBucketPolicy",
		  "s3:GetBucketVersioning",
		  "s3:GetObject",
		  "s3:PutBucketCORS",
		  "s3:PutBucketLogging",
		  "s3:PutBucketVersioning",
		  "s3:PutObject",
		  "s3:ListBucket",
		  "s3:ListAllMyBuckets",
		  "s3:ListBucketVersions"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}