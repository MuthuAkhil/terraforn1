## AWS Account Details
variable "aws_region" {
  type = string
}

## VPC CONFIG
variable "vpc_cidr" {
  type = string
}
variable "vpc_instance_tenancy" {
  type = string
}
variable "vpc_dns_resolution" {
  type = bool
}
variable "vpc_dns_hostnames" {
  type = bool
}
variable "vpc_name_tag" {
  type = string
}

## PUBLIC SUBNET CONFIG
variable "pub_subnet_cidr" {
  type = list(string)
}
variable "pub_subnet_name_tag" {
  type = list(string)
}
variable "pub_subnet_availability_zone" {
  type = list(string)
}



## LMS PRIVATE SUBNET CONFIG
variable "priv_subnet_cidr" {
  type = list(string)
}
variable "priv_subnet_name_tag" {
  type = list(string)
}
variable "priv_subnet_availability_zone" {
  type = list(string)
}



## ## INTERNET GATWAY CONFIG
variable "igw_tag_name" {
  type = string
}



## ## PUBLIC ROUTE TABLE CONFIG
variable "pub_rt_tag_name" {
  type = string
}

## ## NAT GATWAY CONFIG
variable "natgw_tag_name" {
  type = list(string)
}


## ## PRIVATE ROUTE TABLE CONFIG
variable "nat_rt_tag_name" {
  type = list(string)
}
variable "nat_rt_cidr" {
  type = list(string)
}

## NACL CONFIG
variable "nacl_name" {
  type = string
}


## ENDPOINT CONFIG

variable "service_name" {
  type = string
}

variable "env" {
  type = string
}


