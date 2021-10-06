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

resource "aws_nat_gateway" "main_a" {
  allocation_id = aws_eip.main_a.id
  subnet_id     = aws_subnet.main["public_subnet_1"].id
  tags          = var.tags
}

resource "aws_nat_gateway" "main_b" {
  allocation_id = aws_eip.main_b.id
  subnet_id     = aws_subnet.main["public_subnet_2"].id
  tags          = var.tags
}

resource "aws_eip" "main_a" {
  vpc  = true
  tags = var.tags
}

resource "aws_eip" "main_b" {
  vpc  = true
  tags = var.tags
}

resource "aws_route_table" "main_ig" {
  vpc_id = aws_vpc.main.id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
    }
  ]
}
# resource "aws_route_table" "example" {
# vpc_id = aws_vpc.example.id

# route = [
#   {
#     cidr_block = "10.0.1.0/24"
#     gateway_id = aws_internet_gateway.example.id
#   },
#   {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }
# ]

# resource "aws_route_table" "example" {
# vpc_id = aws_vpc.example.id

# route = [
#   {
#     cidr_block = "10.0.1.0/24"
#     gateway_id = aws_internet_gateway.example.id
#   },
#   {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }
# ]