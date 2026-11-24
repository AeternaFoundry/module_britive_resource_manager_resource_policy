variable "resource_manager_resource_policies" {
  description = <<EOT
Map of resource_manager_resource_policies, attributes below
Required:
    - policy_name
Optional:
    - access_level
    - access_type
    - condition
    - consumer
    - description
    - is_active
    - is_draft
    - is_read_only
    - members
    - resource_labels (block):
        - label_key (required)
        - values (required)
EOT

  type = map(object({
    policy_name  = string
    access_level = optional(string)
    access_type  = optional(string)
    condition    = optional(string)
    consumer     = optional(string)
    description  = optional(string)
    is_active    = optional(bool)
    is_draft     = optional(bool)
    is_read_only = optional(bool)
    members      = optional(string)
    resource_labels = optional(list(object({
      label_key = string
      values    = set(string)
    })))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

