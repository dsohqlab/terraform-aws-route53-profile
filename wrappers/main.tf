module "wrapper" {
  source = "../"

  for_each = var.items

  create                = try(each.value.create, var.defaults.create, true)
  name                  = try(each.value.name, var.defaults.name)
  region                = try(each.value.region, var.defaults.region, null)
  resource_associations = try(each.value.resource_associations, var.defaults.resource_associations, {})
  tags                  = try(each.value.tags, var.defaults.tags, {})
}
