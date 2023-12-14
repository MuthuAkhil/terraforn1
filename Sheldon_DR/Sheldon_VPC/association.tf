resource "aws_main_route_table_association" "vpc_rta" {
  vpc_id         = aws_vpc.vpc_main.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_rta" {
  count          = length(aws_subnet.pub_subnet)
  subnet_id      = aws_subnet.pub_subnet[count.index].id
  route_table_id = aws_route_table.pub_rt.id
}


resource "aws_route_table_association" "priv_rta" {
  count          = length(aws_subnet.priv_subnet)
  subnet_id      = aws_subnet.priv_subnet[count.index].id
  route_table_id = aws_route_table.priv_rt[count.index].id
}

resource "aws_vpc_endpoint_route_table_association" "ep_pub" {
  count           = length(aws_route_table.pub_rt)
  route_table_id  = aws_route_table.pub_rt.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

resource "aws_vpc_endpoint_route_table_association" "ep_priv" {
  count           = length(aws_route_table.priv_rt)
  route_table_id  = aws_route_table.priv_rt[count.index].id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

resource "aws_network_acl_association" "nacl_puba" {
  count          = length(aws_subnet.pub_subnet)
  network_acl_id = aws_vpc.vpc_main.default_network_acl_id
  subnet_id      = aws_subnet.pub_subnet[count.index].id
}

resource "aws_network_acl_association" "nacl_priva" {
  count          = length(aws_subnet.priv_subnet)
  network_acl_id = aws_vpc.vpc_main.default_network_acl_id
  subnet_id      = aws_subnet.priv_subnet[count.index].id
}