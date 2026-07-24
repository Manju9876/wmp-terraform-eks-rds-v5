resource "null_resource" "kube-config" {

  depends_on = [aws_eks_node_group.main]

  triggers = {
    alltime = timestamp()
  }

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name wmp-${var.env}"
  }
}

# provider "helm" {
#   kubernetes = {
#     config_path = "~/.kube/config"
#   }
# }

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  depends_on = [
    null_resource.kube-config
  ]
}


resource "helm_release" "kube_prometheus_stack" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"

  namespace        = "prometheus"
  create_namespace = true

  set {
    name  = "prometheus.service.type"
    value = "LoadBalancer"
  }

  depends_on = [
    null_resource.kube-config
  ]
}

resource "helm_release" "file_beat" {
  name             = "filebeat"
  repository       = "https://helm.elastic.co"
  chart            = "filebeat"

  namespace        = "filebeat"
  create_namespace = true

  values = [
  file("${path.module}/filebeat.yml")
  ]

  depends_on = [
    null_resource.kube-config
  ]
}