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
  description = "Version of metric server addon"
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


##
# Add-on Nginx Ingress
##
variable "nginx_ingress" {
  description = "Enabler for nginx Ingress addon"
  type        = bool
  default     = false
}

variable "nginx_ingress_version" {
  description = "Version of nginx Ingress addon"
  type        = string
  default     = "2.1.3"
}

variable "nginx_ingress_replicas" {
  description = "Number of replicas for nginx Ingress"
  type        = number
  default     = 1
}

variable "nginx_ingress_resources" {
  type = object({
    limits_cpu   = optional(string, "1000m")
    limits_mem   = optional(string, "1000Mi")
    requests_cpu = optional(string, "200m")
    requests_mem = optional(string, "200Mi")
  })
  default = {}
}

variable "nginx_ingress_config" {
  description = "Use the Nginx Configuration options https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/configmap/#configuration-options"
  type        = map(string)
  default = {
    "keep-alive-requests" : "100"
  }
}

variable "nginx_ingress_elb_id" {
  description = "Network Load balancer ID, if 'null' ELB Autocreate will use"
  type        = string
  default     = null
}

variable "nginx_ingress_elb_auto_create" {
  description = "ELB Autocreate annotations, https://support.huaweicloud.com/intl/en-us/usermanual-cce/cce_01_0014.html"
  type = object({
    type                 = optional(string, "inner")
    bandwidth_chargemode = optional(string, "traffic")
    bandwidth_size       = optional(number, 5)
    bandwidth_sharetype  = optional(string, "PER")
    eip_type             = optional(string, "5_bgp")
    available_zone       = optional(list(string), [])
    l4_flavor_name       = optional(string, "L4_flavor.elb.s1.small")
  })
  default = {}
}

variable "nginx_ingress_elb_auto_create_az_number" {
  description = "Number of AZ for auto-created ELB if nginx_ingress_elb_auto_create.available_zone is empty"
  type        = number
  default     = 1
}

variable "nginx_ingress_extra_annotations" {
  description = "Extra annotations for Nginx service https://support.huaweicloud.com/intl/en-us/usermanual-cce/cce_01_0014.html"
  type        = map(string)
  default = {
    "kubernetes.io/elb.pass-through" : "true"
  }
}
variable "nginx_ingress_default_backend" {
  description = "Nginx Ingress default backend configuration"
  type = object({
    enable  = optional(bool, false)
    service = optional(string, "")
  })
  default = {}
}
