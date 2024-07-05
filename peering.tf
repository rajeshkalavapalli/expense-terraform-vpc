resource "aws_vpc_peering_connection" "peering" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = var.acceptor_vpc_id == "" ? data.aws_vpc.default.id : var.acceptor_vpc_id
  auto_accept= var.acceptor_vpc_id == "" ? true : false 
}

#route public for vpc 
resource "aws_route" "public_route" {
  count = var.is_peering_required && var.acceptor_vpc_id == "" ? 1 : 0 
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id 
}

#route private for vpc 
resource "aws_route" "private_route" {
  count = var.is_peering_required && var.acceptor_vpc_id == "" ? 1 : 0 
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id 
}

#route database for vpc 
resource "aws_route" "database_route" {
  count = var.is_peering_required && var.acceptor_vpc_id == "" ? 1 : 0 
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id 
}

resource "aws_route" "default_peering" {
  count = var.is_peering_required && var.acceptor_vpc_id == "" ? 1 : 0
  route_table_id            = data.aws_route_table.main.id # default vpc route table
  destination_cidr_block    = var.vpc_cider
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}