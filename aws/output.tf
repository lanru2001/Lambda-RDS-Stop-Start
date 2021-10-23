output "scheduler_lambda_arn" {
  value = aws_lambda_function.lambda_test.arn
}

output "scheduler_lambda_function_name" {
  value = aws_lambda_function.lambda_test.function_name
}
