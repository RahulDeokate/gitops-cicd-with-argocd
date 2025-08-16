variable "vpc_cidr" {
  description = "cidr range for vpc"
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

variable "cluster_name" {
  description = "name of the cluster"
}

variable "desired_size" {
  description = "desired size of nodes"
}

variable "max_size" {
  description = "maz size of nodes"
}

variable "min_size" {
  description = "min size of nodes"
}

variable "node_group_name" {
  description = "node group name"
}

variable "ami" {
  description = "name of ami"
}

variable "instance_type" {
  description = "instance type of jenkins server"
  type = list(string)
  default = ["t2.micro"]
}

variable "key_name" {
  description = "key name of server"
  default = "devops-server"
}