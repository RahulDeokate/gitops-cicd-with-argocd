output "public_subnet_1" {
  description = "subnet 1 id"
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
  description = "subnet 2 id"
  value = aws_subnet.public_subnet_2.id
}

output "ig_id" {
  description = "internet gateway id"
  value = aws_internet_gateway.ig.id
}
