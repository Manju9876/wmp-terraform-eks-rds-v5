# resource "null_resource" "kube_config" {
#
#   triggers = {}
#   provisioner "local-exec" {
#     command = "aws eks update-kubeconfig --name wmp-${var.env}"
#   }
# }

# provider "helm" {
#   kubernetes = {
#     config_path = "~/.kube/config"
#   }
# }

# resource "helm_release" "argocd" {
#   name       = "argocd"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argocd"
#
#   set = [
#     {
#       name  = "server.service.type"
#       value = "LoadBalancer"
#     }
#   ]
# }

# resource "helm_release" "argocd" {
#
#   name       = "argo"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo-cd"
#   namespace  = "default"
#
#   values = [
#     file("${path.module}/argo.yml")
#   ]
# }
#
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
#
# resource "null_resource" "kube-config" {
#
#   triggers = {
#     alltime = timestamp()
#   }
#
#   provisioner "local-exec" {
#     command = "aws eks update-kubeconfig --name ${var.env}"
#   }
#
# }
#
# provider "helm" {
#   kubernetes = {
#     config_path = "~/.kube/config"
#   }
# }
#
# resource "helm_release" "argocd" {
#
#   depends_on = [null_resource.kube-config]
#
#   name       = "argocd"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo-cd"
#
#   set = [
#     {
#       name  = "server.service.type"
#       value = "LoadBalancer"
#     }
#   ]
# }
#
# resource "helm_release" "kube-stack" {
#
#   depends_on = [null_resource.kube-config]
#
#   name       = "kubestack"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "kube-prometheus-stack"
#   set = [
#     {
#       name  = "prometheus.service.type"
#       value = "LoadBalancer"
#     }
#   ]
# }
#
# resource "helm_release" "file-beat" {
#
#   depends_on = [null_resource.kube-config]
#
#   name       = "filebeat"
#   repository = "https://helm.elastic.co"
#   chart      = "filebeat"
#
#   values = [
#     file("${path.module}/filebeat.yml")
#   ]
# }