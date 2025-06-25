resource "aws_sqs_queue" "event_dlq" {
  name = "${var.name}-dlq"
  tags = var.common_tags
}

resource "aws_sqs_queue" "event" {
  name = var.name
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.event_dlq.arn
    maxReceiveCount     = var.max_delivery_attempts
  })
  tags = var.common_tags
}
