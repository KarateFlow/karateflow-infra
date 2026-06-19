resource "kubernetes_resource_quota" "staging_quota" {
  metadata {
    name      = "stg-compute-quota"
    namespace = kubernetes_namespace.staging.metadata[0].name
  }
  spec {
    hard = {
      "requests.cpu"    = "0.5"   # Mezzo core garantito
      "requests.memory" = "256Mi" # 256 MB garantiti
      "limits.cpu"      = "1"     # Massimo 1 core
      "limits.memory"   = "512Mi" # Massimo 512 MB (oltre viene killato)
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