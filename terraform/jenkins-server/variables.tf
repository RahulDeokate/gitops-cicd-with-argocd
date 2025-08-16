variable "vpc_id" {
  description = "vpc id of the project"
}

variable "ami" {
  description = "name of ami"
}

variable "instance_type" {
  description = "instance type of jenkins server"
  type = list(string)
  default = ["t2.micro"] 
}

variable "subnet_1" {
  description = "subnet for jenkins server"
}

variable "key_name" {
  description = "key name of server"
}
