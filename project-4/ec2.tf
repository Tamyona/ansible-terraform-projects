# Data source to find the AMI by name or tag
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Use "self" if the AMI was created in your AWS account

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]  # Replace with the prefix of your Packer AMI name
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]  # Replace with the prefix of your Packer AMI name
  }
} 


resource "aws_instance" "Blue" {
  ami                       = data.aws_ami.ubuntu.id
  instance_type             = var.instance_type
  subnet_id                 = aws_subnet.subnet2.id
  key_name                  = aws_key_pair.deployer.key_name
  vpc_security_group_ids    = [aws_security_group.allow_tls.id]
  user_data                 = file("apache.sh")

  tags = {
    Name = "Blue"
  }
}

resource "aws_instance" "Green" {
  ami                       = data.aws_ami.ubuntu.id
  instance_type             = var.instance_type
  subnet_id                 = aws_subnet.subnet3.id
  key_name                  = aws_key_pair.deployer.key_name
  vpc_security_group_ids    = [aws_security_group.allow_tls.id]
  user_data                 = file("apache.sh")

  tags = {
    Name = "Green"
  }
}