data "kubernetes_service" "argocd" {

  metadata {
    name      = "argo-argocd-server"
    namespace = "default"
  }

  depends_on = [
    helm_release.argocd
  ]
}

# data "kubernetes_secret" "argocd_password" {
#
#   metadata {
#     name      = "argocd-initial-admin-secret"
#     namespace = "default"
#   }
#
#   depends_on = [
#     helm_release.argocd
#   ]
# }