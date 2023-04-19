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
