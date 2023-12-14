resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "${var.pub_rt_tag_name}_${var.env}"
  }
}

resource "aws_route_table" "priv_rt" {
  count  = length(var.nat_rt_tag_name)
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = var.nat_rt_cidr[count.index]
    gateway_id = aws_nat_gateway.natgw[count.index].id
  }




  tags = {
    Name = "${var.nat_rt_tag_name[count.index]}_${var.env}"
  }
}

