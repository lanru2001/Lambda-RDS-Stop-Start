# AWS Lambda need a zip file
data "archive_file"  "lambda_file"{
  type        =  "zip"
  source_file = "lambda.py"
  output_path = "${local.lambda_zip_location}"

}

#AWS Lambda function
resource "aws_lambda_function" "test_lambda" {
  filename         = "data.archive_file.lambda_file.output_path"
  function_name    = "lambda_function_name"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "index.test"
  timeout          = 300
  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #source_code_hash = filebase64sha256("lambda_function_payload.zip")
  source_code_hash = data.archive_file.lambda_file.output_base64sha256
  vpc_config {
    security_group_ids = var.security_group_ids
    subnet_ids         = var.subnet_ids
  }
  runtime = "python2.7"
  
  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.example,
  ]
  environment {
    variables = {
      DBInstanceName = "userDB instance name"
    }
  }
}

resource "aws_cloudwatch_event_target" "example" {
  arn  = aws_lambda_function.example.arn
  rule = aws_cloudwatch_event_rule.example.id

  input_transformer {
    input_paths = {
      instance = "$.detail.instance",
      status   = "$.detail.status",
    }
    input_template = "\"<instance> is in state <status>\""
  }
}

resource "aws_cloudwatch_event_rule" "lambda_event" {
  name        = "lambda-event"
  description = "Lambda fucntion event rule"

  event_pattern = <<EOF
{
  "detail-type": [
    "stop"
    "start"
  ]
}
EOF
}
