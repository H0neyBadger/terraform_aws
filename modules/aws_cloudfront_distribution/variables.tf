
variable "aws_cloudfront_distribution_aliases" {
  type = list(string)
  default = null
}

variable "aws_cloudfront_distribution_comment" {
  type = string
  default = null
}

variable "aws_cloudfront_distribution_default_root_object" {
  type = string
  default = null
}

variable "aws_cloudfront_distribution_enabled" {
  type = bool
}

variable "aws_cloudfront_distribution_http_version" {
  type = string
  default = null
}

variable "aws_cloudfront_distribution_is_ipv6_enabled" {
  type = string
  default = null
}

variable "aws_cloudfront_distribution_price_class" {
  type = string
  default = null
}

variable "aws_cloudfront_distribution_retain_on_delete" {
  type = string
  default = null
}

variable "aws_cloudfront_distribution_wait_for_deployment" {
  type = string
  default = null
}

variable "aws_cloudfront_distribution_web_acl_id" {
  type = string
  default = null
}

variable "aws_cloudfront_distribution_logging_config" {
  type = list(object({
    bucket          = string
    prefix          = optional(string)
    include_cookies = optional(bool)
  }))
  default = []

  validation {
    condition = length(var.aws_cloudfront_distribution_logging_config) <= 1
    error_message = "Maximum 1 logging_config allowed."
  }
}

variable "aws_cloudfront_distribution_origins" {
  type = list(object({
    domain_name          = string
    origin_id            = string
    origin_path          = optional(string)
    s3_origin_config     = optional(list(object({
      origin_access_identity = optional(string)
    })))
    custom_origin_config = optional(list(object({
      http_port                = number
      https_port               = number
      origin_protocol_policy   = string
      origin_ssl_protocols     = optional(string)
      origin_keepalive_timeout = optional(number)
      origin_read_timeout      = optional(number)
    })))
    custom_headers       = optional(list(object({
      name  = string
      value = string
    })))
  }))
}

variable "aws_cloudfront_distribution_origin_groups" {
  type = list(object({
    origin_id         = string
    failover_criteria = optional(list(object({
      status_codes = list(string)
    })))
    members           = list(object({
        origin_id = string
    }))
  }))
  default = []

  validation {
    condition = try(
      alltrue([
      for d in var.aws_cloudfront_distribution_origin_groups:
        length(d.members) == 2
      ]), false
    )
    error_message = "You must define 2 origin_groups members."
  }
}

variable "aws_cloudfront_distribution_ordered_cache_behaviors" {
  type = list(object({
    path_pattern                = string
    target_origin_id            = string
    viewer_protocol_policy      = string
    allowed_methods             = list(string)
    cached_methods              = list(string)
    compress                    = optional(bool)
    field_level_encryption_id   = optional(string)
    smooth_streaming            = optional(bool)
    trusted_signers             = optional(list(string))
    min_ttl                     = optional(number)
    default_ttl                 = optional(number)
    max_ttl                     = optional(number)
    forwarded_values            = list(object({
      query_string            = bool
      query_string_cache_keys = optional(list(string))
      headers                 = optional(list(string))
      cookies                 = list(object({
        forward           = string
        whitelisted_names = optional(list(string))
      }))
    }))
    lambda_function_associations = optional(list(object({
      event_type   = string
      lambda_arn   = string
      include_body = optional(bool)
    })))
  }))

  default = []

  validation {
    condition = try(
      alltrue([
      for d in var.aws_cloudfront_distribution_ordered_cache_behaviors:
        length(d.forwarded_values) == 1
      ]), false
    )
    error_message = "You must define 1 forwarded_values."
  }

  validation {
    condition = try(
      alltrue([
      for d in var.aws_cloudfront_distribution_ordered_cache_behaviors:
        length(d.forwarded_values[0].cookies) == 1
      ]), false
    )
    error_message = "You must define 1 cookies in forwarded_values."
  }

  validation {
    condition = try(
      alltrue([
      for d in var.aws_cloudfront_distribution_ordered_cache_behaviors:
        lookup(d, "lambda_function_associations", null) == null ? true : (length(d.lambda_function_associations) <= 4)
      ]), false
    )
    error_message = "You must define at most 4 lambda_function_associations in forwarded_values."
  }
}

variable "aws_cloudfront_distribution_default_cache_behavior" {
  type = list(object({
    target_origin_id            = string
    viewer_protocol_policy      = string
    allowed_methods             = list(string)
    cached_methods              = list(string)
    compress                    = optional(bool)
    field_level_encryption_id   = optional(string)
    smooth_streaming            = optional(bool)
    trusted_signers             = optional(list(string))
    min_ttl                     = optional(number)
    default_ttl                 = optional(number)
    max_ttl                     = optional(number)
    forwarded_values            = list(object({
      query_string            = bool
      query_string_cache_keys = optional(list(string))
      headers                 = optional(list(string))
      cookies                 = list(object({
        forward           = string
        whitelisted_names = optional(list(string))
      }))
    }))
    lambda_function_associations = optional(list(object({
      event_type   = string
      lambda_arn   = string
      include_body = optional(bool)
    })))
  }))

  validation {
    condition = length(var.aws_cloudfront_distribution_default_cache_behavior) == 1
    error_message = "You must define 1 default_cache_behavior forwarded_values."
  }

  validation {
    condition = try(
      alltrue([
      for d in var.aws_cloudfront_distribution_default_cache_behavior:
        length(d.forwarded_values) == 1
      ]), false
    )
    error_message = "You must define at most 1 forwarded_values."
  }

  validation {
    condition = try(
      alltrue([
      for d in var.aws_cloudfront_distribution_default_cache_behavior:
        length(d.forwarded_values[0].cookies) == 1
      ]), false
    )
    error_message = "You must define at most 1 cookies in forwarded_values."
  }

  validation {
    condition = try(
      alltrue([
      for d in var.aws_cloudfront_distribution_default_cache_behavior:
        lookup(d, "lambda_function_associations", null) == null ? true : length(d.lambda_function_associations) <= 4
      ]), false
    )
    error_message = "You must define at most 4 lambda_function_associations."
  }
}

variable "aws_cloudfront_distribution_viewer_certificate" {
  type = list(object({
    acm_certificate_arn            = optional(string)
    cloudfront_default_certificate = optional(string)
    iam_certificate_id             = optional(string)
    minimum_protocol_version       = optional(string)
    ssl_support_method             = optional(string)
  }))

  validation {
    condition = length(var.aws_cloudfront_distribution_viewer_certificate) <= 1
    error_message = "You must define at most 1 viewer_certificate."
  }
}

variable "aws_cloudfront_distribution_custom_error_responses" {
  type = list(object({
    error_code            = number
    response_code         = optional(number)
    response_page_path    = optional(string)
    error_caching_min_ttl = optional(number)
  }))
  default = []
}

variable "aws_cloudfront_distribution_restrictions" {
  type = list(object({
    geo_restriction = list(object({
      restriction_type = string
      locations        = optional(list(string))
    })) 
  }))

  validation {
    condition = length(var.aws_cloudfront_distribution_restrictions) <= 1
    error_message = "You must define at most 1 geo_restriction."
  }

  validation {
    condition = length(var.aws_cloudfront_distribution_restrictions) < 1 ? true : length(var.aws_cloudfront_distribution_restrictions[0].geo_restriction) == 1
    error_message = "You must define 1 geo_restriction in aws_cloudfront_distribution_restrictions."
  }
}

variable "aws_cloudfront_distribution_name" {
  type = string
  default = "aws-cloudfront-distribution"
}

variable "aws_cloudfront_distribution_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

