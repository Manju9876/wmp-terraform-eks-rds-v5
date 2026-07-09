output "cluster_name" {
  value = aws_eks_cluster.main.name
}
#
# output "aws_eks_cluster" {
#   value = aws_eks_cluster.main.endpoint
# }