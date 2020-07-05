
locals {
  create_sns_topic = var.sns_topic_arn == ""
  sns_topic_arn    = coalesce(var.sns_topic_arn, join("", aws_sns_topic.this[*].arn))
}

#tfsec:ignore:AWS016
resource "aws_sns_topic" "this" {
  count = local.create_sns_topic ? 1 : 0

  name_prefix = var.name
  # kms_master_key_id = var.kms_master_key_id
  tags = var.tags
}

resource "aws_sns_topic_policy" "this" {
  count = local.create_sns_topic ? 1 : 0

  arn    = local.sns_topic_arn
  policy = data.aws_iam_policy_document.this[0].json
}

data "aws_iam_policy_document" "this" {
  count = local.create_sns_topic ? 1 : 0

  policy_id = "__default_policy_ID"

  statement {
    effect    = "Allow"
    sid       = "__default_statement_ID"
    resources = [local.sns_topic_arn]

    actions = [
      "SNS:AddPermission",
      "SNS:DeleteTopic",
      "SNS:GetTopicAttributes",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive",
      "SNS:RemovePermission",
      "SNS:SetTopicAttributes",
      "SNS:Subscribe"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"
      values   = [var.account_id]
    }

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }

  statement {
    effect    = "Allow"
    resources = [local.sns_topic_arn]
    sid       = "CloudWatchEvents"

    actions = ["SNS:Publish"]

    principals {
      identifiers = ["events.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_sns_topic_subscription" "this" {
  topic_arn              = local.sns_topic_arn
  protocol               = var.sns_subscription_protocol
  endpoint               = var.sns_subscription_endpoint
  endpoint_auto_confirms = true
}


resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = "account-billing-alarm-${var.monthly_billing_threshold}"
  alarm_actions       = [local.sns_topic_arn]
  alarm_description   = "Billing alarm account ${var.account_id} >= US$ ${var.monthly_billing_threshold}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "28800"
  statistic           = "Maximum"
  tags                = var.tags
  threshold           = var.monthly_billing_threshold

  dimensions = {
    Currency      = "USD"
    LinkedAccount = var.account_id
  }
}
