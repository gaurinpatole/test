terraform {
  backend "s3" {
    bucket = "gauri-website-hosting-bucket"
    key    = ".terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
