variable "user_messages" {
  description = "Map of users, their messages, and destination"
  type        = map(object({
    message = string
    to_file = bool
  }))
  default     = {
    "Alice" = {
      message = "Hello Alice (updated from stack)"
      to_file = true
    }
    "Bob"   = {
      message = "Hello Bob"
      to_file = false
    }
  }
}

variable "override_to_file" {
  description = "Override destination for all messages"
  type        = bool
  default     = null
}