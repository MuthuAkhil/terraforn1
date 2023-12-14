resource "aws_vpc" "vpc_main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.vpc_instance_tenancy
  enable_dns_hostnames = var.vpc_dns_hostnames
  enable_dns_support   = var.vpc_dns_resolution

  tags = {
    Name = "${var.vpc_name_tag}_${var.env}"
  }
}


resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc_main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["182.71.254.114/32"]
  }
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "all"
    self      = true
  }

  tags = {
    Name = "i2_default_securitygroup"
  }
}

output "VPC_ID" {
  value = aws_vpc.vpc_main.id
}

