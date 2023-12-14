provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "simpli-terraform-prod"
    key    = "lrs-ecs/PROD-terraform.tfstate"
    region = "us-east-1"
  }
}