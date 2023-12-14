resource "aws_flow_log" "flow" {
  log_destination      = aws_s3_bucket.bucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.vpc_main.id
}

resource "aws_s3_bucket" "bucket" {
  bucket = "simplilearn-vpcflowlog-i2vpc-test"
}