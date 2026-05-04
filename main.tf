module "s3" {
  providers = {
    aws.main = aws.main
  }
  source             = "git@github.com:NequiTI/terraform_s3_mod.git//modules/s3?ref=v4.0.0"
  capacity           = var.capacity
  country            = var.country
  env                = var.env
  confidentiality    = var.confidentiality
  owner              = var.owner
  integrity          = var.integrity
  availability       = var.availability
  information_domain = var.information_domain
  personal_data      = var.personal_data
  pci                = var.pci
  bucket_name        = var.bucket_name
  force_destroy      = var.force_destroy
  versioning         = var.versioning
  policies           = local.s3_policies
}

resource "aws_s3_bucket_notification" "eventbridge" {
  bucket      = module.s3.bucket_id
  eventbridge = true
}

resource "aws_lambda_function" "s3_processor" {
  filename         = "lambda/lambda.zip"
  function_name    = "s3-processor-${var.env}"
  role             = data.aws_iam_role.lambda_role.arn
  handler          = var.handler
  source_code_hash = filebase64sha256("lambda/lambda.zip")
  runtime          = var.runtime
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowEventBridgeInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_processor.function_name
  principal     = "events.amazonaws.com"
  source_arn    = module.eventbridge_rule.rule_event_arn
}

module "eventbridge_rule" {
  providers = {
    aws.main = aws.main
  }
  source            = "git@github.com:NequiTI/terraform_eventbridge_rule_Mod.git//modules/eventbridge_rule?ref=v4.0.0"
  country           = var.country
  env               = var.env
  capacity          = var.capacity
  name              = var.rule_name
  description       = var.rule_description
  rule_type         = var.rule_type
  event_pattern     = local.event_pattern
  targets           = local.targets
  statements_policy = []
}

