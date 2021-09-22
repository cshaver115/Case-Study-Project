# terraform {
#   backend "s3" {
#     bucket = var.bucket_name
#     key    = var.key_name
#     region = var.region_name
#   }
# }

provider "aws" {
  region = var.region_name
  
}