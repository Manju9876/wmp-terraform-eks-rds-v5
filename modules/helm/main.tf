resource "null_resource" "kube_config" {

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name wmp-${var.env}"
  }
}

resource "helm_release" "argocd" {

  name       = "argo"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "default"

  values = [
    file("${path.module}/argo.yml")
  ]
}

# resource "null_resource" "argocd_login" {
#
#   depends_on = [
#     helm_release.argocd
#   ]
#
#   provisioner "local-exec" {
#
#     command = <<EOF
# argocd login ${data.kubernetes_service.argocd.status[0].load_balancer[0].ingress[0].hostname} \
#   --username admin \
#   --password $(kubectl get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d) \
#   --insecure
# EOF
#
#   }
# }