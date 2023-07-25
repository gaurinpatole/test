#ACM Certificate. 

resource "aws_acm_certificate" "acm_certificate" {
  domain_name               = var.domain_name
  validation_method = "DNS"
 tags = {
    Environment = "dev"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Uncomment the validation_record_fqdns line if you do DNS validation instead of Email.
resource "aws_acm_certificate_validation" "cert_validation" {
 certificate_arn         = aws_acm_certificate.acm_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}