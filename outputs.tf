##
# Add-on Metrics Server
##
output "metrics_server_status" {
  description = "Add-on Metrics Server status information"
  value       = huaweicloud_cce_addon.metrics_server.0.status
}

output "metrics_server_id" {
  description = " ID of the Add-on Metrics Server instance"
  value       = huaweicloud_cce_addon.metrics_server.0.id
}
