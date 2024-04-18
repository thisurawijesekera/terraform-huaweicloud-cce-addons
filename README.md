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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~>1.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~>1.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_cce_addon.metrics_server](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cce_addon) | resource |
| [huaweicloud_cce_addon.nginx_ingress](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cce_addon) | resource |
| [huaweicloud_availability_zones.zones](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/availability_zones) | data source |
| [huaweicloud_cce_cluster.cluster](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/cce_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Specifies the CCE cluster ID | `string` | n/a | yes |
| <a name="input_metrics_server"></a> [metrics\_server](#input\_metrics\_server) | Enabler for metric server addon | `bool` | `false` | no |
| <a name="input_metrics_server_replicas"></a> [metrics\_server\_replicas](#input\_metrics\_server\_replicas) | Number of replicas for metric server | `string` | `"1"` | no |
| <a name="input_metrics_server_resources"></a> [metrics\_server\_resources](#input\_metrics\_server\_resources) | n/a | <pre>object({<br>    limits_cpu   = optional(string, "100m")<br>    limits_mem   = optional(string, "100Mi")<br>    requests_cpu = optional(string, "100m")<br>    requests_mem = optional(string, "100Mi")<br>  })</pre> | `{}` | no |
| <a name="input_metrics_server_version"></a> [metrics\_server\_version](#input\_metrics\_server\_version) | Version of metric server addon | `string` | `"1.3.2"` | no |
| <a name="input_nginx_ingress"></a> [nginx\_ingress](#input\_nginx\_ingress) | Enabler for nginx Ingress addon | `bool` | `false` | no |
| <a name="input_nginx_ingress_config"></a> [nginx\_ingress\_config](#input\_nginx\_ingress\_config) | Use the Nginx Configuration options https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/configmap/#configuration-options | `map(string)` | <pre>{<br>  "keep-alive-requests": "100"<br>}</pre> | no |
| <a name="input_nginx_ingress_default_backend"></a> [nginx\_ingress\_default\_backend](#input\_nginx\_ingress\_default\_backend) | Nginx Ingress default backend configuration | <pre>object({<br>    enable  = optional(bool, false)<br>    service = optional(string, "")<br>  })</pre> | `{}` | no |
| <a name="input_nginx_ingress_elb_auto_create"></a> [nginx\_ingress\_elb\_auto\_create](#input\_nginx\_ingress\_elb\_auto\_create) | ELB Autocreate annotations, https://support.huaweicloud.com/intl/en-us/usermanual-cce/cce_01_0014.html | <pre>object({<br>    type                 = optional(string, "inner")<br>    bandwidth_chargemode = optional(string, "traffic")<br>    bandwidth_size       = optional(number, 5)<br>    bandwidth_sharetype  = optional(string, "PER")<br>    eip_type             = optional(string, "5_bgp")<br>    available_zone       = optional(list(string), [])<br>    l4_flavor_name       = optional(string, "L4_flavor.elb.s1.small")<br>  })</pre> | `{}` | no |
| <a name="input_nginx_ingress_elb_auto_create_az_number"></a> [nginx\_ingress\_elb\_auto\_create\_az\_number](#input\_nginx\_ingress\_elb\_auto\_create\_az\_number) | Number of AZ for auto-created ELB if nginx\_ingress\_elb\_auto\_create.available\_zone is empty | `number` | `1` | no |
| <a name="input_nginx_ingress_elb_id"></a> [nginx\_ingress\_elb\_id](#input\_nginx\_ingress\_elb\_id) | Network Load balancer ID, if 'null' ELB Autocreate will use | `string` | `null` | no |
| <a name="input_nginx_ingress_extra_annotations"></a> [nginx\_ingress\_extra\_annotations](#input\_nginx\_ingress\_extra\_annotations) | Extra annotations for Nginx service https://support.huaweicloud.com/intl/en-us/usermanual-cce/cce_01_0014.html | `map(string)` | <pre>{<br>  "kubernetes.io/elb.pass-through": "true"<br>}</pre> | no |
| <a name="input_nginx_ingress_replicas"></a> [nginx\_ingress\_replicas](#input\_nginx\_ingress\_replicas) | Number of replicas for nginx Ingress | `number` | `1` | no |
| <a name="input_nginx_ingress_resources"></a> [nginx\_ingress\_resources](#input\_nginx\_ingress\_resources) | n/a | <pre>object({<br>    limits_cpu   = optional(string, "1000m")<br>    limits_mem   = optional(string, "1000Mi")<br>    requests_cpu = optional(string, "200m")<br>    requests_mem = optional(string, "200Mi")<br>  })</pre> | `{}` | no |
| <a name="input_nginx_ingress_version"></a> [nginx\_ingress\_version](#input\_nginx\_ingress\_version) | Version of nginx Ingress addon | `string` | `"2.1.3"` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the CCE node pool resource, if omitted, the provider-level region will be used | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metrics_server_id"></a> [metrics\_server\_id](#output\_metrics\_server\_id) | ID of the Add-on Metrics Server instance |
| <a name="output_metrics_server_status"></a> [metrics\_server\_status](#output\_metrics\_server\_status) | Add-on Metrics Server status information |
<!-- END_TF_DOCS -->