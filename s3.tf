#s3 code for bucket creation, object deployment and adding policies.

 resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = "${aws_s3_bucket.website_bucket.id}"
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
 # resource "aws_s3_bucket_acl" "s3_acl" {
 #   bucket = aws_s3_bucket.website_bucket.id
 #   acl    = "public-read"
 #}
 
resource "aws_s3_bucket_versioning" "website_files" {
  count  = var.bucket_versioning ? 1 : 0
  bucket = "${aws_s3_bucket.website_bucket.id}"
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = "${aws_s3_bucket.website_bucket.id}"
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = "${aws_s3_bucket.website_bucket.id}"
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = "${aws_s3_bucket.website_bucket.id}"
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}
data "aws_iam_policy_document" "allow_access_from_another_account" {
   statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website_bucket.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}
# ## bucket_policy opetionl =============================================================
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = "${aws_s3_bucket.website_bucket.id}"
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_website_configuration" "static_web" {
  bucket = "${aws_s3_bucket.website_bucket.id}"
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
resource "aws_s3_object" "object1" {
  key                    = "index.html"
  bucket                 = "${aws_s3_bucket.website_bucket.id}"
  source                 = "./index.html"
  server_side_encryption = "AES256"
  content_type           = "text/html"
}
resource "aws_s3_object" "object2" {
  key                    = "error.html"
  bucket                 = "${aws_s3_bucket.website_bucket.id}"
  source                 = "./error.html"
  server_side_encryption = "AES256"
  content_type           = "text/html"
}