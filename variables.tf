###
# General variables (these are used across multiple module's resources - DRY
###
variable "project_id" {
  type        = "string"
  description = "GCP project ID to spin this cluster in"
}

variable "timeouts" {
  type        = "map"
  description = "GCP API transaction timeouts"

  default = {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

variable "cluster_region" {
  type        = "string"
  description = "GCP region to spin resources in"
  default     = "us-central1"
}

variable "cluster_name" {
  type        = "string"
  description = "GKE cluster, network & subnetwork name"
  default     = "gke-cluster"
}

###
# GKE specific variables
###
variable "kubernetes_version" {
  type        = "string"
  description = "Kubernetes version to use"
  default     = "1.11.3-gke.24"
}

variable "horizontal_pod_autoscaling" {
  type        = "string"
  description = "The status of the Horizontal Pod Autoscaling addon"
  default     = "true"
}

variable "private_cluster" {
  type        = "string"
  description = "Wether or not this cluster should be private"
  default     = "true"
}

variable "logging_service" {
  description = "The logging service that the cluster should write logs to"
  type        = "string"
  default     = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  description = "The monitoring service that the cluster should write metrics to"
  type        = "string"
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "maintenance_window" {
  type        = "map"
  description = "Time window specified for daily maintenance operations"

  default = {
    start_time = "08:00"
  }
}

variable "cluster_autoscaling" {
  description = "Wether or not to autoscale this cluster"
  type        = "string"
  default     = "true"
}

variable "remove_default_node_pool" {
  description = "Wether or not to append a default node pool to this cluster"
  type        = "string"
  default     = "true"
}

variable "initial_node_count" {
  type        = "string"
  default     = "1"
  description = ") The number of nodes to create in this cluster (not including the Kubernetes master)."
}

variable "service_account_id" {
  type        = "string"
  description = "The service account to be used by the Node VM."
}

variable "vpc_network" {
  type        = "string"
  description = "The VPC in which we're deploying the control plane to."
}

variable "vpc_subnetwork" {
  type        = "string"
  description = "The subnetwork in which we're deploying the control plane to."
}

variable "master_cidr" {
  type        = "string"
  description = "GCP VPC subnetwork CIDR block for kubernetes' controlplane to use"

  # Netmask:   255.255.255.240 = 28
  # Network:   10.0.144.0/28
  # Broadcast: 10.0.144.15
  # HostMin:   10.0.144.1
  # HostMax:   10.0.159.14

  default = "10.0.144.0/28"
}

variable "allowed_cidr_blocks" {
  type        = "list"
  description = "The desired configuration options for master authorized networks. Omit the nested cidr_blocks attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists)"

  default = [{
    cidr_blocks = [{
      cidr_block   = "172.16.15.14/32"
      display_name = "My evil lair"
    }]
  }]

  # Example:
  # master_authorized_networks_config = [{
  # 	cidr_blocks = [{
  # 		cidr_block   = "10.0.0.0/8"
  # 		display_name = "example_network"
  # 	}],
  # }]
}
