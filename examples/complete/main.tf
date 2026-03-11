module "route53_profile" {
  source = "../../"

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
