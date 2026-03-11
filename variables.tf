variable "create" {
  description = "Whether to create a Route53 Profile"
  type        = bool
  default     = true
}

variable "name" {
  description = "(Required) Name of the Profile."
  type        = string
}

variable "region" {
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "resource_associations" {
  description = "(Optional) A map of Association Names to Resource ARNs to associate with the AWS Route53 Profile."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "(Optional) Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {}
}
