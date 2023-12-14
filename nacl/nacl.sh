#!/bin/bash

cd /home/slp09368/Documents/vpc_test
terraform output -raw VPC_ID > /home/slp09368/Documents/terraform_config/vpc_output
cd /home/slp09368/Documents/nacl
terraform init 
terraform fmt
terraform validate
terraform plan
terraform apply -auto-approve
