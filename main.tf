resource "britive_resource_manager_resource_policy" "resource_manager_resource_policies" {
  for_each = var.resource_manager_resource_policies

  policy_name  = each.value.policy_name
  access_level = each.value.access_level
  access_type  = each.value.access_type
  condition    = each.value.condition
  consumer     = each.value.consumer
  description  = each.value.description
  is_active    = each.value.is_active
  is_draft     = each.value.is_draft
  is_read_only = each.value.is_read_only
  members      = each.value.members

  dynamic "resource_labels" {
    for_each = each.value.resource_labels != null ? each.value.resource_labels : []
    content {
      label_key = resource_labels.value.label_key
      values    = resource_labels.value.values
    }
  }
}

