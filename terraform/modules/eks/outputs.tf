output "cluster_name" {
  description = "name of the cluster"
  value = aws_eks_cluster.cluster.name
}

output "cluster_endpoint" {
  description = "cluster end point"
  value = aws_eks_cluster.cluster.endpoint
}

output "cluster_ca_certificate" {
  description = "cluster certificate"
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}
