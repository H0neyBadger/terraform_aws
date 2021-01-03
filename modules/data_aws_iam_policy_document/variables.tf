
variable "aws_iam_policy_document_policy_id" {
  type = string
  default = null
}

variable "aws_iam_policy_document_source_json" {
  type = string
  default = null
}

variable "aws_iam_policy_document_override_json" {
  type = string
  default = null
}

variable "aws_iam_policy_document_version" {
  type = string
  default = null
}

variable "aws_iam_policy_document_statements" {
  type = list(object({
    sid            = optional(string)
    effect         = optional(string)
    actions        = optional(list(string))
    not_actions    = optional(list(string))
    resources      = optional(list(string))
    not_resources  = optional(list(string))
    principals     = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    not_principals     = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    conditions      = optional(list(object({
      test     = string
      variable = string
      values   = list(string)
    })))
  }))
  default = []
}

