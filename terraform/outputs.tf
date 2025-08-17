output "vpc_id" {
  description = "vpc id"
  value = module.vpc.vpc_id
}

output "public_subnet_1" {
  description = "public subnet 1 "
  value = module.networking.public_subnet_1
}

output "public_subnet_2" {
  description = "public subnet 2 "
  value = module.networking.public_subnet_2
}

output "cluster_name" {
  description = "name of the cluster"
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "cluster end point"
  value = module.eks.cluster_endpoint
}

output "cluster_ca_certificate" {
  description = "cluster certificate"
  value = module.eks.cluster_ca_certificate
}

output "node_group_name" {
  description = "node group name"
  value = module.nodegroup.node_group_name
}

output "jenkins_public_ip" {
  description = "jenkins server public ip"
  value = module.ec2-jenkins.jenkins_public_ip
}
