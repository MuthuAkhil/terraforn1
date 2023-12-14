
resource "aws_subnet" "pub_subnet" {
  count             = length(var.pub_subnet_availability_zone)
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.pub_subnet_cidr[count.index]
  availability_zone = var.pub_subnet_availability_zone[count.index]

  tags = {
    Name = "${var.pub_subnet_name_tag[count.index]}_${var.env}"
  }
}



resource "aws_subnet" "priv_subnet" {
  count             = length(var.priv_subnet_availability_zone)
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.priv_subnet_cidr[count.index]
  availability_zone = var.priv_subnet_availability_zone[count.index]

  tags = {
    Name = "${var.priv_subnet_name_tag[count.index]}_${var.env}"
  }
}



output "PUBLIC_SUBNET_1_ID" {
  value = aws_subnet.pub_subnet[*]
}

output "PRIVATE_SUBNET_1_ID" {
  value = aws_subnet.priv_subnet[*]
}

