resource "aws_default_network_acl" "nacl" {
  default_network_acl_id = aws_vpc.vpc_main.default_network_acl_id

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 80
    action     = "deny"
    cidr_block = "209.107.210.0/24"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 81
    action     = "deny"
    cidr_block = "216.151.191.0/24"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 82
    action     = "allow"
    cidr_block = "103.205.152.154/32"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 83
    action     = "deny"
    cidr_block = "205.185.193.131/32"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 84
    action     = "deny"
    cidr_block = "173.195.15.0/24"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 85
    action     = "deny"
    cidr_block = "205.185.209.0/24"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 86
    action     = "allow"
    cidr_block = "27.59.128.187/32"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 89
    action     = "deny"
    cidr_block = "64.145.79.0/24"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 90
    action     = "deny"
    cidr_block = "78.110.173.0/24"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 91
    action     = "deny"
    cidr_block = "173.255.191.13/32"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 92
    action     = "allow"
    cidr_block = "194.39.218.10/32"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 93
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 94
    action     = "deny"
    cidr_block = "173.245.203.232/32"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 95
    action     = "deny"
    cidr_block = "173.245.202.0/24"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 97
    action     = "deny"
    cidr_block = "173.195.15.235/32"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 98
    action     = "deny"
    cidr_block = "173.245.203.64/32"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "all"
    rule_no    = 99
    action     = "deny"
    cidr_block = "52.247.28.132/32"
    from_port  = 0
    to_port    = 0
  }


  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.nacl_name}_${var.env}"
  }
}

