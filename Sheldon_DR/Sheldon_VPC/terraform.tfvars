###Author: Akhil Muthu

#### AWS Account Details
aws_region = "us-west-1"

### ENV

env = "test"

## VPC CONFIG
vpc_cidr             = "10.0.0.0/16"
vpc_instance_tenancy = "default"
vpc_dns_resolution   = true
vpc_dns_hostnames    = true
vpc_name_tag         = "i2_vpc"

## PUBLIC SUBNET CONFIG
pub_subnet_availability_zone = ["us-west-1a", "us-west-1c"]
pub_subnet_cidr              = ["10.0.5.0/24", "10.0.9.0/24"]
pub_subnet_name_tag          = ["lms_public_subnet_AZA", "lms_public_subnet_AZC"]

## PRIVATE SUBNET CONFIG
priv_subnet_availability_zone = ["us-west-1a", "us-west-1c"]
priv_subnet_cidr              = ["10.0.6.0/24", "10.0.10.0/24"]
priv_subnet_name_tag          = ["lms_private_subnet_AZA", "lms_private_subnet_AZC"]


## INTERNET GATWAY CONFIG
igw_tag_name = "i2_vpc_igw"

## PUBLIC ROUTE TABLE CONFIG
pub_rt_tag_name = "i2_public_routing"

## PRivate ROUTE TABLE CONFIG
nat_rt_tag_name = ["NAT-gateway-AZA", "NAT-gateway-AZC"]
nat_rt_cidr     = ["0.0.0.0/0", "0.0.0.0/0"]

## NAT GATWAY CONFIG
natgw_tag_name = ["NAT-gateway-AZA", "NAT-gateway-AZC"]

## NETWORK ACL CONFIG

nacl_name = " i2_lms_crm_vpc_acl"

## ENDPOINT CONFIG

service_name = "com.amazonaws.us-west-1.s3"
