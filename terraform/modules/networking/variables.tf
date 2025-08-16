variable "vpc_id" {
  description = "vpc id"
  type = string
}

variable "cidr_subnet_1" {
  description = "cidr range for subnet 1"
  type = string
}

variable "cidr_subnet_2" {
  description = "cidr range for subnet 2"
  type = string
}

variable "availability_zone_1" {
  description = "availability zone 1"
  type = string
}

variable "availability_zone_2" {
  description = "availability zone 2"
  type = string
}
