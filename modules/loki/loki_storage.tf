resource "kubernetes_persistent_volume_claim" "loki" {
  metadata {
    name      = "loki-data"
    namespace = var.namespace
  }
  lifecycle {
    prevent_destroy = true
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.loki_storage_capacity
      }
    }
  }
}
