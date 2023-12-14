resource "aws_nat_gateway" "natgw" {
  count         = length(var.natgw_tag_name)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.pub_subnet[count.index].id

  tags = {
    Name = "${var.natgw_tag_name[count.index]}_${var.env}"
  }
}