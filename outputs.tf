
output "cloudwatch_metric_alarm_arn" {
  description = "ARN of the billing alarm"
  value       = aws_cloudwatch_metric_alarm.this.arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = local.sns_topic_arn
}

output "sns_topic_subscription_arn" {
  description = "ARN of the SNS topic subscription"
  value       = aws_sns_topic_subscription.this.arn
}
