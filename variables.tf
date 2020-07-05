
variable "account_id" {
  description = "ID of AWS account to monitor"
  type        = string
}

# variable "kms_master_key_id" {
#   default     = "alias/aws/sns"
#   description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK."
#   type        = string
# }

variable "monthly_billing_threshold" {
  description = "The threshold for which estimated monthly charges will trigger the metric alarm."
  type        = number
}

variable "name" {
  description = "Moniker to apply to all resources in the module. `name_prefix` is used where available"
  type        = string
}

variable "sns_subscription_endpoint" {
  description = "(Required) The endpoint to send data to, the contents will vary with the protocol."
  type        = string
}

variable "sns_subscription_protocol" {
  default     = "sms"
  description = "The protocol to use. The possible values for this are: sqs, sms, lambda, application. (http or https are partially supported."
  type        = string
}

variable "sns_topic_arn" {
  default     = ""
  description = "(Optional) ARN of pre-existing SNS topic. Leaving this null creates a new SNS topic."
  type        = string
}

variable "tags" {
  default     = {}
  description = "User-Defined tags"
  type        = map(string)
}
