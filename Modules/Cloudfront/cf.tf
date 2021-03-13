# -------------------- Cloudfront Access Identity ----------------------------------------#

resource "aws_cloudfront_origin_access_identity" "access-identity-web-dev" {
  comment = "access-identity-web-dev"
}


#---------------------- Cloudfront Distributions ----------------------------------------#

resource "aws_cloudfront_distribution" "pop-test" {
  aliases             = ["pop-test.aws.paysign.com", ]
  comment             = "https://pop-test.aws.paysign.com"
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_200"
  retain_on_delete    = false
  tags                = {}
  wait_for_deployment = true

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", ]
    cached_methods         = ["GET", "HEAD", ]
    compress               = false
    default_ttl            = 86400
    max_ttl                = 31536000
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "S3-pop-test.aws.paysign.com"
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers                 = []
      query_string            = false
      query_string_cache_keys = []

      cookies {
        forward           = "none"
        whitelisted_names = []
      }
    }
  }

  logging_config {
    bucket          = "s3-dev-logs.aws.paysign.com.s3.amazonaws.com"
    include_cookies = false
    prefix          = "cf-pop-test"
  }

  origin {
    domain_name = "pop-test.aws.paysign.com.s3.amazonaws.com"
    origin_id   = "S3-pop-test.aws.paysign.com"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/EY3ZVJQTWMXFY"
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:561688265541:certificate/9a7764f5-eb06-47c9-ba99-e09ea3a72436"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.1_2016"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "mycard-dev" {
  aliases             = ["mycard-dev.aws.paysign.com", ]
  comment             = "https://mycard-dev.aws.paysign.com"
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_100"
  retain_on_delete    = false
  tags = {
    "Name"    = "CF_mycard_vev"
    "Project" = "cardholder_portal"
  }
  wait_for_deployment = true

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", ]
    cached_methods         = ["GET", "HEAD", ]
    compress               = false
    default_ttl            = 86400
    max_ttl                = 31536000
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "S3-mycard-dev.aws.paysign.com"
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers                 = []
      query_string            = false
      query_string_cache_keys = []

      cookies {
        forward           = "none"
        whitelisted_names = []
      }
    }

    lambda_function_association {
      event_type   = "origin-response"
      include_body = false
      lambda_arn   = "arn:aws:lambda:us-east-1:561688265541:function:Lambda_Security_Headers_for_Portal_CF_Web_Sites:6"
    }
  }

  logging_config {
    bucket          = "s3-dev-logs.aws.paysign.com.s3.amazonaws.com"
    include_cookies = false
    prefix          = "cf_mycard_dev/"
  }

  origin {
    domain_name = "mycard-dev.aws.paysign.com.s3.amazonaws.com"
    origin_id   = "S3-mycard-dev.aws.paysign.com"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/EY3ZVJQTWMXFY"
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:561688265541:certificate/9a7764f5-eb06-47c9-ba99-e09ea3a72436"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.1_2016"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "afforda" {
  aliases          = ["afforda.us", "www.afforda.us"]
  comment          = "https://www.afforda.us"
  enabled          = true
  http_version     = "http2"
  is_ipv6_enabled  = true
  price_class      = "PriceClass_100"
  retain_on_delete = false
  tags = {
    "Name"    = "cf_afforda_us"
    "Project" = "copay"
  }
  wait_for_deployment = true

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", ]
    cached_methods         = ["GET", "HEAD", ]
    compress               = false
    default_ttl            = 86400
    max_ttl                = 31536000
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "S3-www.afforda.us"
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers                 = []
      query_string            = false
      query_string_cache_keys = []

      cookies {
        forward           = "none"
        whitelisted_names = []
      }
    }
  }

  logging_config {
    bucket          = "s3-dev-logs.aws.paysign.com.s3.amazonaws.com"
    include_cookies = false
    prefix          = "cf_www_afforda_us/"
  }

  origin {
    domain_name = "www.afforda.us.s3.amazonaws.com"
    origin_id   = "S3-www.afforda.us"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/EY3ZVJQTWMXFY"
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:561688265541:certificate/30736e9d-8256-419a-86ec-5fffdc5f3ee8"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.1_2016"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "copayportal-dev" {
  aliases             = ["copayportal-dev.aws.paysign.com"]
  comment             = "https://copayportal-dev.aws.paysign.com"
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_100"
  retain_on_delete    = false
  tags = {
    "Name"    = "cf_copay_poral_dev"
    "Project" = "copay"
  }
  wait_for_deployment = true

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", ]
    cached_methods         = ["GET", "HEAD", ]
    compress               = false
    default_ttl            = 86400
    max_ttl                = 31536000
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "S3-copayportal-dev.aws.paysign.com"
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers                 = []
      query_string            = false
      query_string_cache_keys = []

      cookies {
        forward           = "none"
        whitelisted_names = []
      }
    }

    lambda_function_association {
      event_type   = "origin-request"
      include_body = false
      lambda_arn   = "arn:aws:lambda:us-east-1:561688265541:function:Lambda_Add_Index_html_to_Cloudfront_Sites:2"
    }

    lambda_function_association {
      event_type   = "origin-response"
      include_body = false
      lambda_arn   = "arn:aws:lambda:us-east-1:561688265541:function:Lambda_Security_Headers_for_Copay_Sites:11"
    }
  }

  logging_config {
    bucket          = "s3-dev-logs.aws.paysign.com.s3.amazonaws.com"
    include_cookies = false
    prefix          = "cf_copayportal_dev/"
  }

  origin {
    domain_name = "copayportal-dev.aws.paysign.com.s3.amazonaws.com"
    origin_id   = "S3-copayportal-dev.aws.paysign.com"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/EY3ZVJQTWMXFY"
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:561688265541:certificate/9a7764f5-eb06-47c9-ba99-e09ea3a72436"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.1_2016"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "portal-test" {
  aliases             = ["portal-test.paysignpremier.com"]
  comment             = "https://portal-test.paysignpremier.com"
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_100"
  retain_on_delete    = false
  wait_for_deployment = true

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", ]
    cached_methods         = ["GET", "HEAD", ]
    compress               = false
    default_ttl            = 86400
    max_ttl                = 31536000
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "S3-portal-test.paysignpremier.com"
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers                 = []
      query_string            = false
      query_string_cache_keys = []

      cookies {
        forward           = "none"
        whitelisted_names = []
      }
    }

    lambda_function_association {
      event_type   = "origin-response"
      include_body = false
      lambda_arn   = "arn:aws:lambda:us-east-1:561688265541:function:Lambda_security_Headers_for_Paysign_Premier_Sites:7"
    }
  }

  logging_config {
    bucket          = "s3-dev-logs.aws.paysign.com.s3.amazonaws.com"
    include_cookies = false
    prefix          = "cf_paysignpremier_test/"
  }

  origin {
    domain_name = "portal-test.paysignpremier.com.s3.amazonaws.com"
    origin_id   = "S3-portal-test.paysignpremier.com"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/EY3ZVJQTWMXFY"
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:561688265541:certificate/bb0db715-a5c9-4024-91dd-2c2bbb91967e"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.1_2016"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "copayportal-test" {
  aliases          = ["copayportal-test.aws.paysign.com"]
  comment          = "https://copayportal-test.aws.paysign.com"
  enabled          = true
  http_version     = "http2"
  is_ipv6_enabled  = true
  price_class      = "PriceClass_100"
  retain_on_delete = false
  tags = {
    "Name"    = "cf_copay_portal_test"
    "Project" = "copay"
  }
  wait_for_deployment = true

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", ]
    cached_methods         = ["GET", "HEAD", ]
    compress               = false
    default_ttl            = 86400
    max_ttl                = 31536000
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "S3-copayportal-test.aws.paysign.com"
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers                 = []
      query_string            = false
      query_string_cache_keys = []

      cookies {
        forward           = "none"
        whitelisted_names = []
      }
    }

    lambda_function_association {
      event_type   = "origin-request"
      include_body = false
      lambda_arn   = "arn:aws:lambda:us-east-1:561688265541:function:Lambda_Add_Index_html_to_Cloudfront_Sites:2"
    }

    lambda_function_association {
      event_type   = "origin-response"
      include_body = false
      lambda_arn   = "arn:aws:lambda:us-east-1:561688265541:function:Lambda_Security_Headers_for_Copay_Sites:11"
    }
  }

  logging_config {
    bucket          = "s3-dev-logs.aws.paysign.com.s3.amazonaws.com"
    include_cookies = false
    prefix          = "cf_copayportal_test/"
  }

  origin {
    domain_name = "copayportal-test.aws.paysign.com.s3.amazonaws.com"
    origin_id   = "S3-copayportal-test.aws.paysign.com"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/EY3ZVJQTWMXFY"
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:561688265541:certificate/9a7764f5-eb06-47c9-ba99-e09ea3a72436"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.1_2016"
    ssl_support_method             = "sni-only"
  }
}
