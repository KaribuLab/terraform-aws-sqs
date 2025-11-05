variable name {
  type        = string
  description = "The name of the module"
}

variable max_delivery_attempts {
  type        = number
  description = "The max delivery attempts for the SNS topic"
}

variable visibility_timeout_seconds  {
  type        = number
  description = "Visibility timeout for the queue"
}

variable common_tags {
  type        = map(string)
  description = "The common tags for the SNS topic"
}