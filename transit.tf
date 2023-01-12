resource "aws_ec2_transit_gateway" "tgw" {
  description                     = "VPC connection point"
  default_route_table_propagation = "enable"
  default_route_table_association = "enable"

  tags = {
    "Name" = "VPC Hub"
  }
}

// Attachment A
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_at" {
  vpc_id             = aws_vpc.vpc_a.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  subnet_ids         = [aws_subnet.subnet_a.id]

  tags = {
    "Name" = "TGWA AT"
  }
}

// Attachment B
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_bt" {
  vpc_id             = aws_vpc.vpc_b.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  subnet_ids         = [aws_subnet.subnet_b.id]

  tags = {
    "Name" = "TGWA BT"
  }
}

// Attachment C
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_ct" {
  vpc_id             = aws_vpc.vpc_c.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  subnet_ids         = [aws_subnet.subnet_c.id]

  tags = {
    "Name" = "TGWA CT"
  }
}