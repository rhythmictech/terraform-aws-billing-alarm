
data "aws_caller_identity" "current" {}

variable "your_cellphone_number" {}

module "example" {
  source = "../.."

  name                      = "test"
  account_id                = data.aws_caller_identity.current.account_id
  monthly_billing_threshold = 3.50
  sns_subscription_endpoint = var.your_cellphone_number

  tags = {
    Name      = "test-billing-alarm"
    delete_me = "please"
  }
}

output "example" {
  value = module.example
}
