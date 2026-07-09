# data "kubernetes_service_v1" "argocd" {
#
#   metadata {
#     name      = "argo-argocd-server"
#     namespace = "default"
#   }
# }
# data "kubernetes_secret_v1" "argocd_password" {
#   metadata {
#     name      = "argocd-initial-admin-secret"
#     namespace = "default"
#   }
# }