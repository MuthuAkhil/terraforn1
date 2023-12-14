resource "aws_eip" "nat" {
  count      = length(var.natgw_tag_name)
  depends_on = [aws_internet_gateway.gw]
}
