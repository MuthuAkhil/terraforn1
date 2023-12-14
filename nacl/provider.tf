provider "aws" {
  region = "us-west-1"
  //access_key=value
  //secret_key=value
}

terraform {
  backend "s3" {
    profile = "default"
    bucket  = "simpli-terraform-state-dev"
    key     = "nacl/NACL-terraform.tfstate" // variable
    region  = "us-east-2"
  }
}