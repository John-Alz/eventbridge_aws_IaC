data "aws_caller_identity" "current" {
  provider = aws.main
}

data "aws_iam_role" "lambda_role" {
  name = "apimdemo-LambdaExecutionRole"
}