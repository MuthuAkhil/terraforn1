provider "aws" {
  region = var.aws_region
  //access_key=value
  //secret_key=value
}

terraform {
  backend "s3" {
    profile = "default"
    bucket  = "simpli-terraform-state-dev"
    key     = "Sheldon_DR/MemChache.tfstate" // variable
    region  = "us-east-2"
  }
}
