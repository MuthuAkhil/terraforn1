data "aws_security_group" "memcache_sg"{
  tags = {
    Name = "memcache-sg" 
  }
}

data "aws_subnets" "private" {
  filter {
    name = "tag:Name"
    values = [var.private_subnet_name]
  }
}

data "aws_subnet" "subnet_values" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}

resource "aws_elasticache_subnet_group" "subnet_group" {
  name       = "Sheldon-memcache-subnet"
  subnet_ids = [for s in data.aws_subnet.subnet_values : s.id]
}

resource "aws_elasticache_cluster" "memcache_cluster" {
  cluster_id           = "sheldon-memcache-server"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.6"
  port                 = 11222
  engine_version       = "1.6.17"
  subnet_group_name    = aws_elasticache_subnet_group.subnet_group.name
  security_group_ids  = [data.aws_security_group.memcache_sg.id]
}
