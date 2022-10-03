locals {
  default_quotas = {
     "requests.cpu"                                                        = "0"
      "requests.memory"                                                    = "0Gi"
      "limits.cpu"                                                         = "0"
      "limits.memory"                                                      = "0Gi"
      "requests.storage"                                                   = "0Gi"
      "persistentvolumeclaims"                                             = "0Gi"
      "azurefile.storageclass.storage.k8s.io/requests.storage"             = "0Gi"
      "azurefile-premium.storageclass.storage.k8s.io/requests.storage"     = "0Gi"
      "azurefile-csi.storageclass.storage.k8s.io/requests.storage"         = "0Gi"
      "azurefile-csi-premium.storageclass.storage.k8s.io/requests.storage" = "0Gi"
      "default.storageclass.storage.k8s.io/requests.storage"               = "0Gi"
      "managed-csi-hdd.storageclass.storage.k8s.io/requests.storage"       = "0Gi"
      "managed.storageclass.storage.k8s.io/requests.storage"               = "0Gi"
      "managed-premium.storageclass.storage.k8s.io/requests.storage"       = "0Gi"
      "managed-csi.storageclass.storage.k8s.io/requests.storage"           = "0Gi"
      "managed-csi-premium.storageclass.storage.k8s.io/requests.storage"   = "0Gi"

  }
}