variable "cluster_name" {
  description = "name of the cluster"
}

variable "node_group_name" {
  description = "name of the node group"
  default = "node_group"
}

variable "public_subnet_1" {
  description = "subnet 1 value"
}

variable "public_subnet_2" {
  description = "subnet 2 value"
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

variable "instance_type" {
  description = "ec2 instance type"
  type = list(string)
  default = [ "t2.micro" ]
}
