
resource "aws_cloudfront_distribution" "cloudfront_distribution" {

  aliases             = var.aws_cloudfront_distribution_aliases
  comment             = var.aws_cloudfront_distribution_comment
  default_root_object = var.aws_cloudfront_distribution_default_root_object
  enabled             = var.aws_cloudfront_distribution_enabled
  http_version        = var.aws_cloudfront_distribution_http_version
  is_ipv6_enabled     = var.aws_cloudfront_distribution_is_ipv6_enabled
  price_class         = var.aws_cloudfront_distribution_price_class
  retain_on_delete    = var.aws_cloudfront_distribution_retain_on_delete
  wait_for_deployment = var.aws_cloudfront_distribution_wait_for_deployment
  web_acl_id          = var.aws_cloudfront_distribution_web_acl_id

  dynamic "logging_config" {
    for_each = var.aws_cloudfront_distribution_logging_config
    iterator = each

    content {
      bucket          = each.value.bucket
      prefix          = each.value.prefix
      include_cookies = each.value.include_cookies
    }
  }

  dynamic "origin" {
    for_each = var.aws_cloudfront_distribution_origins
    iterator = each

    content {
      domain_name = each.value.domain_name
      origin_id   = each.value.origin_id
      origin_path = each.value.origin_path

      dynamic "s3_origin_config" {
        for_each = each.value.s3_origin_config == null ? [] : each.value.s3_origin_config
        iterator = each 

        content {
          origin_access_identity = each.value.origin_access_identity
        }
      }

      dynamic "custom_origin_config" {
        for_each = each.value.custom_origin_config == null ? [] : each.value.custom_origin_config
        iterator = each

        content {
          http_port                = each.value.http_port
          https_port               = each.value.https_port
          origin_protocol_policy   = each.value.origin_protocol_policy
          origin_ssl_protocols     = each.value.origin_ssl_protocols
          origin_keepalive_timeout = each.value.origin_keepalive_timeout
          origin_read_timeout      = each.value.origin_read_timeout
        }
      }

      dynamic "custom_header" {
        for_each = each.value.custom_headers == null ? [] : each.value.custom_headers
        iterator = each

        content {
          name  = each.value.name
          value = each.value.value
        }
      }
    }
  }

  dynamic "origin_group" {
    for_each = var.aws_cloudfront_distribution_origin_groups
    iterator = each

    content {
      origin_id = each.value.origin_id

      dynamic "failover_criteria" {
        for_each = each.value.failover_criteria
        iterator = each

        content {
          status_codes = each.value.status_codes
        }
      }
     
      dynamic "member" {
        for_each = each.value.members
        iterator = each

        content {
          origin_id = each.value.origin_id
        }
      }
    }
  }

  dynamic "default_cache_behavior" {
    for_each = var.aws_cloudfront_distribution_default_cache_behavior
    iterator = each

    content {
      target_origin_id       = each.value.target_origin_id
      viewer_protocol_policy = each.value.viewer_protocol_policy

      allowed_methods           = each.value.allowed_methods
      cached_methods            = each.value.cached_methods
      compress                  = each.value.compress
      field_level_encryption_id = each.value.field_level_encryption_id
      smooth_streaming          = each.value.smooth_streaming
      trusted_signers           = each.value.trusted_signers

      min_ttl     = each.value.min_ttl
      default_ttl = each.value.default_ttl
      max_ttl     = each.value.max_ttl

      dynamic "forwarded_values" {
        for_each = each.value.forwarded_values == null ? [] : each.value.forwarded_values
        iterator = each

        content {
          query_string            = each.value.query_string
          query_string_cache_keys = each.value.query_string_cache_keys
          headers                 = each.value.headers

          dynamic "cookies" {
            for_each = each.value.cookies == null ? [] : each.value.cookies
            iterator = each

            content {
              forward           = each.value.forward
              whitelisted_names = each.value.whitelisted_names
            }
          }
        }
      }

      dynamic "lambda_function_association" {
        for_each = each.value.lambda_function_associations == null ? [] : each.value.lambda_function_associations
        iterator = each

        content {
          event_type   = each.value.event_type
          lambda_arn   = each.value.lambda_arn
          include_body = each.value.include_body
        }
      }
    }
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.aws_cloudfront_distribution_ordered_cache_behaviors
    iterator = each

    content {
      path_pattern           = each.value.path_pattern
      target_origin_id       = each.value.target_origin_id
      viewer_protocol_policy = each.value.viewer_protocol_policy

      allowed_methods           = each.value.allowed_methods
      cached_methods            = each.value.cached_methods
      compress                  = each.value.compress
      field_level_encryption_id = each.value.field_level_encryption_id
      smooth_streaming          = each.value.smooth_streaming
      trusted_signers           = each.value.trusted_signers

      min_ttl     = each.value.min_ttl
      default_ttl = each.value.default_ttl
      max_ttl     = each.value.max_ttl

      dynamic "forwarded_values" {
        for_each = each.value.forwarded_values == null ? [] : each.value.forwarded_values
        iterator = each

        content {
          query_string            = each.value.query_string
          query_string_cache_keys = each.value.query_string_cache_keys
          headers                 = each.value.headers

          dynamic "cookies" {
            for_each = each.value.cookies == null ? [] : each.value.cookies
            iterator = each

            content {
              forward           = each.value.forward
              whitelisted_names = each.value.whitelisted_names
            }
          }
        }
      }

      dynamic "lambda_function_association" {
        for_each = each.value.lambda_function_associations == null ? [] : each.value.lambda_function_associations
        iterator = each

        content {
          event_type   = each.value.event_type
          lambda_arn   = each.value.lambda_arn
          include_body = each.value.include_body
        }
      }
    }
  }

  dynamic "viewer_certificate" {
    for_each = var.aws_cloudfront_distribution_viewer_certificate
    iterator = each

    content {
      acm_certificate_arn            = each.value.acm_certificate_arn
      cloudfront_default_certificate = each.value.cloudfront_default_certificate
      iam_certificate_id             = each.value.iam_certificate_id
      minimum_protocol_version       = each.value.minimum_protocol_version
      ssl_support_method             = each.value.ssl_support_method
    }
  }

  dynamic "custom_error_response" {
    for_each = var.aws_cloudfront_distribution_custom_error_responses
    iterator = each

    content {
      error_code = each.value.error_code

      response_code         = each.value.response_code
      response_page_path    = each.value.response_page_path
      error_caching_min_ttl = each.value.error_caching_min_ttl
    }
  }

  dynamic "restrictions" {
    for_each = var.aws_cloudfront_distribution_restrictions
    iterator = each

    content {
      dynamic "geo_restriction" {
        for_each = each.value.geo_restriction == null ? [] : each.value.geo_restriction
        iterator = each

        content {
          restriction_type = each.value.restriction_type
          locations        = each.value.locations
        }
      }
    }
  }

  tags = merge(
    {
      "Name" = format("%s", var.aws_cloudfront_distribution_name)
    },
    var.tags,
    var.aws_cloudfront_distribution_tags,
  )

}
