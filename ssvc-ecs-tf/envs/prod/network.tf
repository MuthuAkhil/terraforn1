data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    // values = ["i20-staging-vpc"]
    values = [var.vpc_name]
  }
}

data "aws_subnets" "Private" {
  //vpc_id = data.aws_vpc.vpc.id
  filter {
    name = "tag:Name"
    //values = ["i20-staging-private*"] # insert values here
    values = [var.private_subnet_name]
  }
}

data "aws_subnet" "subnet_values" {
  for_each = toset(data.aws_subnets.Private.ids)
  id       = each.value
}

data "aws_subnets" "public" {
  //vpc_id = data.aws_vpc.vpc.id
  filter {
    name = "tag:Name"
    //values = ["i20-staging-public*"] # insert values here
    values = [var.public_subnet_name]
  }
}