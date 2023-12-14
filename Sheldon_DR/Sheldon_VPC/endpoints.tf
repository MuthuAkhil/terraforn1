resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc_main.id
  service_name = var.service_name
}