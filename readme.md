# Module - Quotas AKS
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module created to help the quota management in AKS environments. If you want to use this module in GKE, OKE or EKS you'll have to change the storage classes on [resource.tf](resource.tf)

## Compatibility matrix

| Module Version | Terraform Version | Kubernetes Provider Version |
|----------------|-------------------| --------------- |
| v1.0.0       | v1.3.1 | 2.13.1         |

## Specifying a version

To avoid that your code get automatically updates for the module is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can use a specific version of the module.

Note: The `?ref=***` refers a tag on the git module repo.

## Use case for default quota (no cpu/memory and storage)

```hcl
module "<clustername>-<quotas>" {
  source = "git::https://github.com/danilomnds/terraform-kubernetes-resource-quota?ref=v1.0.0"
  quota = {
    <namespace-name> = {
      # is mandatory to pass at least one namespace
      namespace         = <namespace-name>
    }    
  }
}
```

## Use case for custom quota

```hcl
module "<clustername>-<quotas>" {
  source = "git::https://github.com/danilomnds/terraform-kubernetes-resource-quota?ref=v1.0.0"
  quota = {
    <namespace-name> = {
      # is mandatory to pass at least one namespace
      namespace    = <namespace-name>
      # if you want a custom suffix name
      suffix_quota = "custom"
      # if you want to define some tags (this is not mandatory)
      labels = {
        "app" = "some app"
        "env" = "fqa"
      }
      # if you don't specify a value for the resource the quota will be 0
      "requests.cpu" = "1"
      "requests.memory" = "1Gi"
      "limits.cpu" = "2"
      "limits.memory" = "2Gi"
      "requests.storage" = "210Gi"
      "persistentvolumeclaims" = "12"
      "azurefile.storageclass.storage.k8s.io/requests.storage" = "0Gi"
      "azurefile-csi.storageclass.storage.k8s.io/requests.storage" = "110Gi"
      "azurefile-csi-premium.storageclass.storage.k8s.io/requests.storage" = "100Gi"
      "azurefile-premium.storageclass.storage.k8s.io/requests.storage" = "0Gi"
      "default.storageclass.storage.k8s.io/requests.storage" = "0Gi"
      "managed.storageclass.storage.k8s.io/requests.storage" = "0Gi"
      "managed-csi.storageclass.storage.k8s.io/requests.storage" = "0Gi"
      "managed-csi-premium.storageclass.storage.k8s.io/requests.storage" = "0Gi"
      "managed-premium.storageclass.storage.k8s.io/requests.storage" = "0Gi"
    }
  }
}
```

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| quota | Definitions for the quota creation  | `any` | n/a | yes |

## Documentation

Terraform kubernetes_role: <br>
[https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/resource_quota](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/resource_quota)<br>