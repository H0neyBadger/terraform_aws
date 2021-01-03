
data "aws_iam_policy_document" "iam_policy_document" {
  policy_id     = var.aws_iam_policy_document_policy_id
  source_json   = var.aws_iam_policy_document_source_json
  override_json = var.aws_iam_policy_document_override_json
  version       = var.aws_iam_policy_document_version

  dynamic "statement" {
    for_each = var.aws_iam_policy_document_statements
    iterator = each

    content {
      sid            = each.value.sid
      effect         = each.value.effect
      actions        = each.value.actions
      not_actions    = each.value.not_actions
      resources      = each.value.resources
      not_resources  = each.value.not_resources

      dynamic "principals" {
        for_each = each.value.principals == null ? [] : each.value.principals
        iterator = each

        content {
          type        = each.value.type
          identifiers = each.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = each.value.not_principals == null ? [] : each.value.principals
        iterator = each

        content {
          type        = each.value.type
          identifiers = each.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = each.value.conditions == null ? [] : each.value.conditions
        iterator = each

        content {
          test     = each.value.test
          variable = each.value.variable
          values   = each.value.values
        }
      }
    }
  }
}

