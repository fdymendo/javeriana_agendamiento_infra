resource "aws_cloudfront_distribution" "cdn" {
    depends_on = [
      aws_s3_bucket.frontend
    ]
  enabled = true
  http_version = "http2"
  
  origin {
    domain_name = aws_s3_bucket.frontend.bucket_domain_name
    origin_id   = aws_s3_bucket.frontend.bucket

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    target_origin_id       = aws_s3_bucket.frontend.bucket
    viewer_protocol_policy = "allow-all"

    allowed_methods = [
      "GET",
      "HEAD",
    ]

    cached_methods = [
      "GET",
      "HEAD",
    ]

    forwarded_values {
      query_string = false

      headers = [
        "Access-Control-Request-Headers",
        "Access-Control-Request-Method",
        "Origin",
      ]

      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400

    compress = true
  }

  viewer_certificate {   
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = aws_s3_bucket.frontend.bucket
}