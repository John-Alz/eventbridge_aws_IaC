locals {

  event_pattern = jsonencode({
    source      = ["aws.s3"]
    detail-type = ["Object Created"]
    detail = {
      bucket = {
        name = [module.s3.bucket_id]
      }
    }
  })

  targets = [
    {
      target_id     = "lambda-s3-processor"
      arn           = aws_lambda_function.s3_processor.arn
      required_role = false
    }
  ]

  s3_policies = [
    {
      effect = "Allow"
      principals = [
        {
          type        = "AWS"
          identifiers = [data.aws_caller_identity.current.account_id]
        }
      ]
      actions = [
        "s3:GetObject"
      ]
      resources = ["${module.s3.bucket_arn}/*"]
    }
  ]

}