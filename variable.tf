variable "aws_region_name" {
  description = "AWS region where all the resources are going to create"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  type        = string
  description = "The domain name for the website"
  default     = "gauri.dev.devopsinabox.aaic.cc"
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket without the www. prefix(normally domain_name)"
  default     = "gauritest1"
}

variable "aws_route53_record" {
  type        = string
  description = "Provide Record name."
  default     = "gauri.dev.devopsinabox.aaic.cc"
}

variable "aws_route53_zone" {
  type        = string
  default     = "dev.devopsinabox.aaic.cc"
}

variable "website_additional_domains" {
  type        = string
  default     = "gauri.dev.devopsinabox.aaic.cc"
}

variable "validate_certificate" {
  description = "Whether to validate certificate by creating Route53 record"
  type        = bool
  default     = true
}

variable "bucket_versioning" {
  type        = bool
  description = "Either you want to enable versioning for the S3 bucket or not"
  default     = false
}

variable "cloudfront_distribution_id" {
  type        = string
  description = "Enter your cloudfront distribution id. "
  default     = "E69Z08G5ZTM7H"
}
