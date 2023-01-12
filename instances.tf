resource "aws_key_pair" "ssh_kp" {
  key_name   = "sshkey"
  public_key = file(var.SSH_PUBLIC_KEY)
}

//////// instance A
resource "aws_instance" "ia" {
  instance_type               = "t4g.nano"
  ami                         = var.AMI
  subnet_id                   = aws_subnet.subnet_a.id
  vpc_security_group_ids      = [aws_security_group.sg_a.id]
  key_name                    = aws_key_pair.ssh_kp.key_name
  associate_public_ip_address = true

  tags = {
    Name = "Instance A"
  }
}

output "ia_public_ip" {
  value = aws_instance.ia.public_ip
}

output "ia_private_ip" {
  value = aws_instance.ia.private_ip
}

////// Instance B
resource "aws_instance" "ib" {
  instance_type          = "t4g.nano"
  ami                    = var.AMI
  subnet_id              = aws_subnet.subnet_b.id
  vpc_security_group_ids = [aws_security_group.sg_b.id]
  key_name               = aws_key_pair.ssh_kp.key_name

  tags = {
    Name = "Instance B"
  }
}

output "ib_private_ip" {
  value = aws_instance.ib.private_ip
}

/////// Instance C
resource "aws_instance" "ic" {
  instance_type          = "t4g.nano"
  ami                    = var.AMI
  subnet_id              = aws_subnet.subnet_c.id
  vpc_security_group_ids = [aws_security_group.sg_c.id]
  key_name               = aws_key_pair.ssh_kp.key_name

  tags = {
    Name = "Instance C"
  }
}

output "ic_private_ip" {
  value = aws_instance.ic.private_ip
}
