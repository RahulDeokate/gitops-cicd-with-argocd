output "jenkins_id" {
  description = "jenkins server id"
  value = aws_instance.jenkins_server.id
}

output "jenkins_public_ip" {
  description = "public ip of jenkins server"
  value = aws_instance.jenkins_server.public_ip
}
