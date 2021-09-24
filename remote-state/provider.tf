terraform {
  backend "s3" {
    bucket = "chases-project-bucket"
    key    = "remote-state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region_name

}