# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53profiles_profile
# Creating AWS Route 53 Profile.
resource "aws_route53profiles_profile" "this" {
  for_each = var.create && var.name != null ? { create = true } : {}

  name   = var.name
  region = var.region
  tags   = var.tags
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53profiles_resource_association
# Creating AWS Route 53 Profiles Resource Association.
resource "aws_route53profiles_resource_association" "this" {
  for_each = var.create ? var.resource_associations : {}

  name         = each.key
  profile_id   = aws_route53profiles_profile.this["create"].id
  region       = var.region
  resource_arn = each.value
}
