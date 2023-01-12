/////// Route A

resource "aws_route_table" "rt_a" {
  vpc_id = aws_vpc.vpc_a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_a.id
  }

  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    "Name" = "RT A"
  }
}

resource "aws_route_table_association" "rta_a" {
  route_table_id = aws_route_table.rt_a.id
  subnet_id      = aws_subnet.subnet_a.id
}

/////// Route B

resource "aws_route_table" "rt_b" {
  vpc_id = aws_vpc.vpc_b.id

  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    "Name" = "RT B"
  }
}

resource "aws_route_table_association" "rta_b" {
  route_table_id = aws_route_table.rt_b.id
  subnet_id      = aws_subnet.subnet_b.id
}

//////// Route C

resource "aws_route_table" "rt_c" {
  vpc_id = aws_vpc.vpc_c.id

  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    "Name" = "RT C"
  }
}

resource "aws_route_table_association" "rta_c" {
  route_table_id = aws_route_table.rt_c.id
  subnet_id      = aws_subnet.subnet_c.id
}