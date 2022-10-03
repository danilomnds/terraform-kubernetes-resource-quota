resource "kubernetes_resource_quota" "quota" {
  for_each = var.definition
  metadata {
    name      = lookup(each.value, "suffix_quota", null) == null ? ("quota-${each.value.namespace}") : ("quota-${each.value.namespace}-${lookup(each.value, "suffix_quota", null)}")
    namespace = each.value.namespace
    labels    = lookup(each.value, "labels", null)
  }
  spec {
    hard = merge(local.default_quotas, lookup(each.value, "quotas", null))
  }
}