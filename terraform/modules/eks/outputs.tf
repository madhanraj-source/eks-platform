output "cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}