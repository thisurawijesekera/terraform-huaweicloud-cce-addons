##
# Common variables
##
variable "region" {
  description = "Specifies the region in which to create the CCE node pool resource, if omitted, the provider-level region will be used"
  type        = string
  default     = null
}

variable "cluster_id" {
  description = "Specifies the CCE cluster ID"
  type        = string
  nullable    = false
}

##
# Add-on Metrics Server
##
variable "metrics_server" {
  description = "Enabler for metric server addon"
  type        = bool
  default     = false
}

variable "metrics_server_version" {
  description = "Enabler for metric server addon"
  type        = string
  default     = "1.3.2"
}

variable "metrics_server_replicas" {
  description = "Number of replicas for metric server"
  type        = string
  default     = "1"
}

variable "metrics_server_resources" {
  type = object({
    limits_cpu   = optional(string, "100m")
    limits_mem   = optional(string, "100Mi")
    requests_cpu = optional(string, "100m")
    requests_mem = optional(string, "100Mi")
  })
  default = {}
}
