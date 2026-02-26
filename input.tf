variable "name" {
  type        = string
  description = "The name of the module"
}

variable "fifo_queue" {
  type        = bool
  description = "Whether the queue is a FIFO queue"
  default     = false

}

variable "create_dlq" {
  type        = bool
  description = "Whether to create a dead letter queue"
  default     = true
}

variable "visibility_timeout_seconds" {
  type        = number
  description = "Visibility timeout for the queue"
}

variable "redrive_policy" {
  type        = map(string)
  description = "Redrive policy for the queue"
  default     = null
}

variable "common_tags" {
  type        = map(string)
  description = "The common tags for the SNS topic"
}
