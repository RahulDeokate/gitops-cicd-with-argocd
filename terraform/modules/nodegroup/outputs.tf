output "node_group_name" {
  description = "node group name"
  value = aws_eks_node_group.node_group
}

output "node_role_arn" {
  description = "node role arn"
  value = aws_iam_role.eks_node_role.arn
}
