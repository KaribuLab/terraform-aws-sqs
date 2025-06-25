output "queue_arn" {
  value       = aws_sqs_queue.event.arn
  description = "The ARN of the SQS queue"
}

output "queue_url" {
  value       = aws_sqs_queue.event.url
  description = "The URL of the SQS queue"
}
