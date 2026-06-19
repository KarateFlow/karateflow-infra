resource "kubernetes_namespace" "staging" {
  metadata {
    name = "karateflow-stg"
    labels = {
      environment = "staging"
      managed-by  = "terraform"
    }
  }
}

resource "kubernetes_namespace" "production" {
  metadata {
    name = "karateflow-prod"
    labels = {
      environment = "production"
      managed-by  = "terraform"
    }
  }
}