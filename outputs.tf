output "cloudfront_distribution_domain_name" {
  description = "Domain name of the cloudfront distribution having origin as S3 bucket with www prefix"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "root_cloudfront_domain_name" {
  description = "Domain name of the cloudfront distribution having origin as S3 bucket without any prefix"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}


output "acm_certificate_status" {
  description = "Status of the acm certificate"
  value       = aws_acm_certificate.acm_certificate.status
}

output "acm_certificate_arn" {
  description = "ARN of the acm certificate"
  value       = aws_acm_certificate.acm_certificate.arn
}

