resource "null_resource" "kube_config" {
  depends_on = [aws_eks_node_group.main]

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name wmp-${var.env}"
  }
}
