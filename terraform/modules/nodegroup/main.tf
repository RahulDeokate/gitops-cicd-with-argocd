resource "aws_iam_role" "eks_node_role" {
  name = "eks_node_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
            Service = "ec2.amazonaws.com"
        }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "node_policies" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ])

  role       = aws_iam_role.eks_node_role.name
  policy_arn = each.value
}

resource "aws_eks_node_group" "node_group" {
  cluster_name = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn = aws_iam_role.eks_node_role.arn

  subnet_ids = [var.public_subnet_1, var.public_subnet_2]

  scaling_config {
    desired_size = var.desired_size
    max_size = var.max_size
    min_size = var.min_size
  }

  instance_types = var.instance_type

  depends_on = [ aws_iam_role_policy_attachment.node_policies ]
}
