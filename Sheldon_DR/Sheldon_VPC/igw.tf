resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = "${var.igw_tag_name}_${var.env}"
  }
}
