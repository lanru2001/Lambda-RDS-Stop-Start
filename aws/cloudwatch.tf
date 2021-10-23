# Cloudwatch log
resource "aws_cloudwatch_log_group" "lambda_log" {
  name              = "lambda/${var.lambda_function_name}"
  retention_in_days = 14
}

# Cloudwatch event rule
resource "aws_cloudwatch_event_rule" "check-scheduler-event" {
  name                = "${var.resource_name_prefix}check-scheduler-event"
  description         = "check-scheduler-event"
  schedule_expression = var.schedule_expression
  depends_on          = [aws_lambda_function.scheduler_lambda]
}


# Cloudwatch event target
resource "aws_cloudwatch_event_target" "check-scheduler-event-lambda-target" {
  target_id = "check-scheduler-event-lambda-target"
  rule      = aws_cloudwatch_event_rule.check-scheduler-event.name
  arn       = aws_lambda_function.scheduler_lambda.arn
}


