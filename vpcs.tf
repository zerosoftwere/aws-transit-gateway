//////////// vpc-A

resource "aws_vpc" "vpc_a" {
  cidr_block = "10.10.0.0/16"

  tags = {
    "Name" = "VPC A"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.vpc_a.id
  availability_zone       = "us-east-1a"
  cidr_block              = "10.10.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "Subnet A"
  }
}

resource "aws_internet_gateway" "igw_a" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    "Name" = "IGW A"
  }
}

resource "aws_security_group" "sg_a" {
  vpc_id      = aws_vpc.vpc_a.id
  name        = "SG-A"
  description = "SG C"

  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    description = "Allow SSH"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.0.0.0/8"]
    protocol    = "-1"
    description = "Internal"
  }

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    description = "Allow all"
  }

  tags = {
    "Name" = "SG A"
  }
}

////////////// VPC-B

resource "aws_vpc" "vpc_b" {
  cidr_block = "10.20.0.0/16"

  tags = {
    "Name" = "VPC B"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.vpc_b.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.20.0.0/24"

  tags = {
    "Name" = "Subnet B"
  }
}

resource "aws_security_group" "sg_b" {
  vpc_id      = aws_vpc.vpc_b.id
  name        = "SG-B"
  description = "SG B"

  ingress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.0.0.0/8"]
    protocol    = "-1"
    description = "Internal"
  }

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.0.0.0/8"]
    protocol    = "-1"
    description = "Internal"
  }

  tags = {
    "Name" = "SG B"
  }
}


//////////// VPC-C

resource "aws_vpc" "vpc_c" {
  cidr_block = "10.30.0.0/16"
}

resource "aws_subnet" "subnet_c" {
  vpc_id            = aws_vpc.vpc_c.id
  availability_zone = "us-east-1c"
  cidr_block        = "10.30.0.0/24"

  tags = {
    "Name" = "Subnet C"
  }
}

resource "aws_security_group" "sg_c" {
  vpc_id      = aws_vpc.vpc_c.id
  description = "SG C"
  name        = "SG-C"

  ingress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.0.0.0/8"]
    protocol    = "-1"
    description = "Internal"
  }

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.0.0.0/8"]
    protocol    = "-1"
    description = "Internal"
  }
  tags = {
    "Name" = "SG-C"
  }
}
