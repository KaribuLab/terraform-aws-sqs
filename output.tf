output "queue_arn" {
  value       = aws_sqs_queue.event.arn
  description = "The ARN of the SQS queue"
}

output "queue_url" {
  value       = aws_sqs_queue.event.url
  description = "The URL of the SQS queue"
}

output "queue_name" {
  value       = aws_sqs_queue.event.name
  description = "The name of the SQS queue"
}

output "dlq_arn" {
  value       = aws_sqs_queue.event_dlq[0].arn
  description = "The ARN of the DLQ"
}

output "dlq_url" {
  value       = aws_sqs_queue.event_dlq[0].url
  description = "The URL of the DLQ"
}

output "dlq_name" {
  value       = aws_sqs_queue.event_dlq[0].name
  description = "The name of the DLQ"
}
