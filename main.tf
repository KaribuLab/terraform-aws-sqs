resource "aws_sqs_queue" "event_dlq" {
  count = var.create_dlq ? 1 : 0
  name = "${var.name}-dlq"
  tags = var.common_tags
}

resource "aws_sqs_queue" "event" {
  name = var.fifo_queue ? "${var.name}.fifo" : var.name
  fifo_queue = var.fifo_queue
  redrive_policy = var.redrive_policy != null ? jsonencode(merge(var.redrive_policy, {
    deadLetterTargetArn = aws_sqs_queue.event_dlq[0].arn
  })) : null
  visibility_timeout_seconds = var.visibility_timeout_seconds
  tags                       = var.common_tags
}
