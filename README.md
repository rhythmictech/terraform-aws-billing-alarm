# terraform-aws-billing-alarm
Template repository for terraform modules. Good for any cloud and any provider.

[![tflint](https://github.com/rhythmictech/terraform-aws-billing-alarm/workflows/tflint/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-billing-alarm/actions?query=workflow%3Atflint+event%3Apush+branch%3Amain)
[![tfsec](https://github.com/rhythmictech/terraform-aws-billing-alarm/workflows/tfsec/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-billing-alarm/actions?query=workflow%3Atfsec+event%3Apush+branch%3Amain)
[![yamllint](https://github.com/rhythmictech/terraform-aws-billing-alarm/workflows/yamllint/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-billing-alarm/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amain)
[![misspell](https://github.com/rhythmictech/terraform-aws-billing-alarm/workflows/misspell/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-billing-alarm/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amain)
[![pre-commit-check](https://github.com/rhythmictech/terraform-aws-billing-alarm/workflows/pre-commit-check/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-billing-alarm/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amain)
<a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=twitter" alt="follow on Twitter"></a>

## Example
Here's what using the module will look like
```hcl
module "example" {
  source = "rhythmictech/terraform-mycloud-mymodule
}
```

## About
A bit about this module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.14 |
| aws | >= 2.64.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.64.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | ID of AWS account to monitor | `string` | n/a | yes |
| monthly\_billing\_threshold | The threshold for which estimated monthly charges will trigger the metric alarm. | `number` | n/a | yes |
| name | Moniker to apply to all resources in the module. `name_prefix` is used where available | `string` | n/a | yes |
| sns\_subscription\_endpoint | (Required) The endpoint to send data to, the contents will vary with the protocol. | `string` | n/a | yes |
| sns\_subscription\_protocol | The protocol to use. The possible values for this are: sqs, sms, lambda, application. (http or https are partially supported. | `string` | `"sms"` | no |
| sns\_topic\_arn | (Optional) ARN of pre-existing SNS topic. Leaving this null creates a new SNS topic. | `string` | `""` | no |
| tags | User-Defined tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudwatch\_metric\_alarm\_arn | ARN of the billing alarm |
| sns\_topic\_arn | ARN of the SNS topic |
| sns\_topic\_subscription\_arn | ARN of the SNS topic subscription |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## The Giants Underneath this Module
- [pre-commit.com](pre-commit.com)
- [terraform.io](terraform.io)
- [github.com/tfutils/tfenv](github.com/tfutils/tfenv)
- [github.com/segmentio/terraform-docs](github.com/segmentio/terraform-docs)
