locals {
    public_cidr = ["10.0.0.0/24", "10.0.1.0/24"]
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public" {
  count = 2

  vpc_id     = aws_vpc.main.id
  cidr_block = local.public_cidr[count.index]

  tags = {
    Name = "public${count.index}"
  }
}

