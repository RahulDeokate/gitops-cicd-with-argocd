resource "aws_security_group" "jenkins_sg" {
  name = "jenkins_sg"
  vpc_id = var.vpc_id

  ingress {
    description = "allow ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow http"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_server" {
  ami = var.ami
  instance_type = var.instance_type[0]
  subnet_id = var.subnet_1
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  key_name = var.key_name
  user_data = file("${path.module}/jenkins-install.sh")
}
