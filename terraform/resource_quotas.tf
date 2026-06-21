resource "kubernetes_resource_quota" "staging_quota" {
  metadata {
    name      = "stg-compute-quota"
    namespace = kubernetes_namespace.staging.metadata[0].name
  }
  spec {
    hard = {
      "requests.cpu"    = "1"   # Alzato per risolvere exceeded quotas frontend
      "requests.memory" = "512Mi" # Alzato per risolvere exceeded quotas frontend 
      "limits.cpu"      = "1.5"     # Massimo 1 core
      "limits.memory"   = "1Gi" # Limite alzato da 512Mi a 1Gi
    }
  }
}

resource "kubernetes_resource_quota" "production_quota" {
  metadata {
    name      = "prod-compute-quota"
    namespace = kubernetes_namespace.production.metadata[0].name
  }
  spec {
    hard = {
      "requests.cpu"    = "1"
      "requests.memory" = "512Mi"
      "limits.cpu"      = "2"
      "limits.memory"   = "1Gi"
    }
  }
}