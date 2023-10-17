#role
resource "aws_iam_role" "cloudfronts3_role" {
  name = "cloudfronts3_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "cloudfronts3_role"
  }
}



resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.cloudfronts3_role.name
  policy_arn = aws_iam_policy.codekalam_policy.arn
}