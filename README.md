# Huawei Cloud Container Engine Add-ons

[Add-ons documentation](https://support.huaweicloud.com/intl/en-us/usermanual-cce/cce_10_0064.html)

To get information about add-on use the following data `huaweicloud_cce_addon_template`.

Example for `metrics-server` add-on

```hcl
data "huaweicloud_cce_addon_template" "test" {
  cluster_id = var.cce_cluster_id
  name       = "metrics-server"
  version    = "1.3.2"
}

output "version" {
  value = data.huaweicloud_cce_addon_template.test
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~>1.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~>1.47 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_cce_addon.metrics_server](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cce_addon) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Specifies the CCE cluster ID | `string` | n/a | yes |
| <a name="input_metrics_server"></a> [metrics\_server](#input\_metrics\_server) | Enabler for metric server addon | `bool` | `false` | no |
| <a name="input_metrics_server_replicas"></a> [metrics\_server\_replicas](#input\_metrics\_server\_replicas) | Number of replicas for metric server | `string` | `"1"` | no |
| <a name="input_metrics_server_resources"></a> [metrics\_server\_resources](#input\_metrics\_server\_resources) | n/a | <pre>object({<br>    limits_cpu   = optional(string, "100m")<br>    limits_mem   = optional(string, "100Mi")<br>    requests_cpu = optional(string, "100m")<br>    requests_mem = optional(string, "100Mi")<br>  })</pre> | `{}` | no |
| <a name="input_metrics_server_version"></a> [metrics\_server\_version](#input\_metrics\_server\_version) | Enabler for metric server addon | `string` | `"1.3.2"` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the CCE node pool resource, if omitted, the provider-level region will be used | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metrics_server_id"></a> [metrics\_server\_id](#output\_metrics\_server\_id) | ID of the Add-on Metrics Server instance |
| <a name="output_metrics_server_status"></a> [metrics\_server\_status](#output\_metrics\_server\_status) | Add-on Metrics Server status information |
<!-- END_TF_DOCS -->