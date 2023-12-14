resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  key_algorithm     = "RSA_2048"

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "show_ssl_info_for_cnames" {
  value = aws_acm_certificate.cert.domain_validation_options
}