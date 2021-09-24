resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags       = var.tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags   = var.tags
}

resource "aws_subnet" "main" {
  for_each = var.subnet_settings

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value["subnet_cidr"]
  tags              = var.tags
  availability_zone = each.value["availability_zone"]
}