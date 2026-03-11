output "arn" {
  value       = try(aws_route53profiles_profile.this["create"].arn, null)
  description = "ARN of the Profile"
}

output "name" {
  value       = try(aws_route53profiles_profile.this["create"].name, null)
  description = "Name of the Profile"
}

output "id" {
  value       = try(aws_route53profiles_profile.this["create"].id, null)
  description = "ID of the Profile"
}

output "name_id" {
  value       = { for k, v in aws_route53profiles_profile.this : v.name => v.id }
  description = "Map of Name and ID of the Profile"
}

output "resource_association_id" {
  value       = { for k, v in aws_route53profiles_resource_association.this : k => v.id }
  description = "ID of the Profile Resource Association"
}

output "resource_association_name" {
  value       = { for k, v in aws_route53profiles_resource_association.this : k => v.name }
  description = "Name of the Profile Resource Association"
}
