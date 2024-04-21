resource "helm_release" "argo_cd" {
  name = "argocd"

  atomic = true
  chart = "./argo-cd"
  namespace = "argocd"
  create_namespace = true
  # version = var.argo_cd_helm_version
}