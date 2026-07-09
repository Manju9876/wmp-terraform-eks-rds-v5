resource "null_resource" "kube_config" {

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name wmp-${var.env}"
  }
}
