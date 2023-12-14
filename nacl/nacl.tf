resource "aws_network_acl" "nacl" {
  vpc_id = var.vpc_id

  tags = {
    Name = "lms"
  }
}
