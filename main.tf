##
# Add-on Metrics Server
##
resource "huaweicloud_cce_addon" "metrics_server" {
  count = var.metrics_server ? 1 : 0

  cluster_id    = var.cluster_id
  region        = var.region
  template_name = "metrics-server"
  version       = var.metrics_server_version
  values {
    basic_json = jsonencode({})
    flavor_json = jsonencode(
      {
        "description" : "Metrics Server is a cluster-level resource usage data aggregator.",
        "name" : "metrics-server",
        "replicas" : var.metrics_server_replicas,
        "resources" : [
          {
            "name" : "metrics-server",
            "limitsCpu" : var.metrics_server_resources.limits_cpu,
            "limitsMem" : var.metrics_server_resources.limits_mem,
            "requestsCpu" : var.metrics_server_resources.requests_cpu,
            "requestsMem" : var.metrics_server_resources.requests_mem
          }
        ]
      }
    )
  }
}

##
# Add-on nginx Ingress
##
data "huaweicloud_availability_zones" "zones" {}

data "huaweicloud_cce_cluster" "cluster" {
  id = var.cluster_id
}

resource "huaweicloud_cce_addon" "nginx_ingress" {
  count = var.nginx_ingress ? 1 : 0

  cluster_id    = var.cluster_id
  region        = var.region
  template_name = "nginx-ingress"
  version       = var.nginx_ingress_version
  values {
    basic_json = jsonencode({})
    custom_json = jsonencode(
      {
        config : var.nginx_ingress_config
        defaultBackend : {
          enabled = var.nginx_ingress_default_backend.enable
        }
        defaultBackendService : var.nginx_ingress_default_backend.service
        headers : {}
        service : {
          annotations : merge(
            { for id in [var.nginx_ingress_elb_id] : "kubernetes.io/elb.id" => id if id != null },
            (var.nginx_ingress_elb_id == null ? {
              "kubernetes.io/elb.autocreate" : format("%#v", merge(
                { for k, v in var.nginx_ingress_elb_auto_create : k => v },
                { for name in [format("bandwidth-cce-%s", var.cluster_id)] : "bandwidth_name" => name },
                { for name in [format("%s-nlb-%s", data.huaweicloud_cce_cluster.cluster.name, var.nginx_ingress_elb_auto_create.type)] : "name" => name },
                { for zone in [slice(data.huaweicloud_availability_zones.zones.names, 0, var.nginx_ingress_elb_auto_create_az_number)] : "available_zone" => zone
                if length(var.nginx_ingress_elb_auto_create.available_zone) == 0 },
              ))
            } : {}),
            var.nginx_ingress_extra_annotations
          )
        }
        tcp : {}
        udp : {}
      }
    )
    flavor_json = jsonencode(
      {
        "description" : "An nginx Ingress controller that uses ConfigMap to store the nginx configuration.",
        "name" : "nginx-ingress",
        "replicas" : var.nginx_ingress_replicas,
        "resources" : [
          {
            "name" : "nginx-ingress",
            "limitsCpu" : var.nginx_ingress_resources.limits_cpu,
            "limitsMem" : var.nginx_ingress_resources.limits_mem,
            "requestsCpu" : var.nginx_ingress_resources.requests_cpu,
            "requestsMem" : var.nginx_ingress_resources.requests_mem
          }
        ]
      }
    )
  }
}
