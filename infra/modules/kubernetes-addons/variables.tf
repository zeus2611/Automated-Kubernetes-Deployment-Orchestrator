variable "env" {
  description = "The environment name"
  type = string
}

variable "eks_name" {
  description = "The name of the EKS cluster"
  type = string
}

variable "enable_cluster_autoscaler" {
  description = "Enable the cluster autoscaler"
  type = bool
  default = false
}

variable "openid_provider_arn" {
  description = "The ARN of the OpenID Connect provider for the EKS cluster"
  type = string
}

variable "cluster_autoscaler_helm_version" {
  description = "The version of the cluster autoscaler to install"
  type = string
}

# variable "argo_cd_helm_version" {
#   description = "The version of the Argo CD to install"
#   type = string
# }