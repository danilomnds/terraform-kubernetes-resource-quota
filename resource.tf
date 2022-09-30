resource "kubernetes_resource_quota" "quota" {
  for_each = var.quota
  metadata {
    name      = lookup(each.value, "suffix_quota", null) == null ? ("quota-${each.value.namespace}") : ("quota-${each.value.namespace}-${lookup(each.value, "suffix_quota", null)}")
    namespace = each.value.namespace
    labels    = lookup(each.value, "labels", null)
  }
  spec {
    hard = {
      "requests.cpu"                                                       = lookup(each.value, "requests.cpu", "0")
      "requests.memory"                                                    = lookup(each.value, "requests.memory", "0Gi")
      "limits.cpu"                                                         = lookup(each.value, "limits.cpu", "0")
      "limits.memory"                                                      = lookup(each.value, "limits.memory", "0Gi")
      "requests.storage"                                                   = lookup(each.value, "requests.storage", "0Gi")
      "persistentvolumeclaims"                                             = lookup(each.value, "persistentvolumeclaims", "0Gi")
      "azurefile.storageclass.storage.k8s.io/requests.storage"             = lookup(each.value, "azurefile.storageclass.storage.k8s.io/requests.storage", "0Gi")
      "azurefile-premium.storageclass.storage.k8s.io/requests.storage"     = lookup(each.value, "azurefile-premium.storageclass.storage.k8s.io/requests.storage", "0Gi")
      "azurefile-csi.storageclass.storage.k8s.io/requests.storage"         = lookup(each.value, "azurefile-csi.storageclass.storage.k8s.io/requests.storage", "0Gi")
      "azurefile-csi-premium.storageclass.storage.k8s.io/requests.storage" = lookup(each.value, "azurefile-csi-premium.storageclass.storage.k8s.io/requests.storage", "0Gi")
      "default.storageclass.storage.k8s.io/requests.storage"               = lookup(each.value, "default.storageclass.storage.k8s.io/requests.storage", "0Gi")
      "managed-csi-hdd.storageclass.storage.k8s.io/requests.storage"       = lookup(each.value, "managed-csi-hdd.storageclass.storage.k8s.io/requests.storage", "0Gi")
      "managed.storageclass.storage.k8s.io/requests.storage"               = lookup(each.value, "managed.storageclass.storage.k8s.io/requests.storage", "0Gi")
      "managed-premium.storageclass.storage.k8s.io/requests.storage"       = lookup(each.value, "managed-premium.storageclass.storage.k8s.io/requests.storage", "0Gi")
      "managed-csi.storageclass.storage.k8s.io/requests.storage"           = lookup(each.value, "managed-csi.storageclass.storage.k8s.io/requests.storage", "0Gi")
      "managed-csi-premium.storageclass.storage.k8s.io/requests.storage"   = lookup(each.value, "managed-csi-premium.storageclass.storage.k8s.io/requests.storage", "0Gi")
    }
  }
}