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


