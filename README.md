# terraform-aws-route53-profile

Terraform module that creates an AWS Route 53 Profile and optional Route 53 Profiles resource associations.

- create [Route53 Profile](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/profiles.html)
- associate [Route53 resources to the Profile](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/profile-create.html)

## Usage

To create a Route53 Profile and associated resources, define the following input variables:

1. `name` - This will be the name of the Route53 Profile
2. `resource_associations` - This maps association names to resource ARNs that will be associated with the Route53 Profile

## Examples

### Profile only

```hcl
module "route53_profile" {
  source  = "dsohqlab/route53-profile/aws"
  version = "~> 1.0.0"

  name = "profile-1"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

### Profile with associations

```hcl
module "route53_profile" {
  source  = "dsohqlab/route53-profile/aws"
  version = "~> 1.0.0"

  name = "profile-1"
  resource_associations = {
    resolver-rule-1 = "arn:aws:route53resolver:eu-central-1:123456789012:resolver-rule/rslvr-rr-01a2bcd3456e7890f"
    resolver-rule-2 = "arn:aws:route53resolver:eu-central-1:123456789012:resolver-rule/rslvr-rr-02a2bcd3456e7890f"
  }
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Best practices notes

- Use provider `default_tags` for global tags and pass module-specific tags only when needed.
- Keep `resource_associations` small and stable; changes to keys will force replacement of associations.
- If you want to disable creation, set `create = false` and omit `name`.

## Doc generation

Code formatting and documentation for variables and outputs is generated using
[pre-commit-terraform
hooks](https://github.com/antonbabenko/pre-commit-terraform) which uses
[terraform-docs](https://github.com/terraform-docs/terraform-docs).

Follow [these
instructions](https://github.com/antonbabenko/pre-commit-terraform#how-to-install)
to install pre-commit locally.

And install `terraform-docs` with `go get github.com/terraform-docs/terraform-docs`
or `brew install terraform-docs`.

## Contributing

Report issues/questions/feature requests on in the
[issues](https://github.com/dsohqlab/terraform-aws-route53-profile/issues/new)
section.

Full contributing [guidelines are covered
here](https://github.com/dsohqlab/terraform-aws-route53-profile/blob/main/.github/CONTRIBUTING.md).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.28 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.28 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53profiles_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53profiles_profile) | resource |
| [aws_route53profiles_resource_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53profiles_resource_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create a Route53 Profile | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the Profile. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | (Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration. | `string` | `null` | no |
| <a name="input_resource_associations"></a> [resource\_associations](#input\_resource\_associations) | (Optional) A map of Association Names to Resource ARNs to associate with the AWS Route53 Profile. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Map of tags to assign to the resource. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the Profile |
| <a name="output_id"></a> [id](#output\_id) | ID of the Profile |
| <a name="output_name"></a> [name](#output\_name) | Name of the Profile |
| <a name="output_name_id"></a> [name\_id](#output\_name\_id) | Map of Name and ID of the Profile |
| <a name="output_resource_association_id"></a> [resource\_association\_id](#output\_resource\_association\_id) | ID of the Profile Resource Association |
| <a name="output_resource_association_name"></a> [resource\_association\_name](#output\_resource\_association\_name) | Name of the Profile Resource Association |
