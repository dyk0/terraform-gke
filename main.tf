resource "google_container_cluster" "primary" {
  provider                          = "google-beta"
  project                           = "${var.project_id}"
  name                              = "${var.cluster_name}"
  region                            = "${var.cluster_region}"
  network                           = "${var.vpc_network}"
  subnetwork                        = "${var.vpc_subnetwork}"
  min_master_version                = "${var.kubernetes_version}"
  logging_service                   = "${var.logging_service}"
  monitoring_service                = "${var.monitoring_service}"
  timeouts                          = "${var.timeouts}"
  remove_default_node_pool          = "${var.remove_default_node_pool}"
  initial_node_count                = "${var.initial_node_count}"
  master_authorized_networks_config = "${var.allowed_cidr_blocks}"

  private_cluster_config {
    enable_private_nodes   = "${var.private_cluster}"
    master_ipv4_cidr_block = "${var.master_cidr}"
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = "${var.horizontal_pod_autoscaling ? 0 : 1}"
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods-range"
    services_secondary_range_name = "services-range"
  }

  maintenance_policy {
    daily_maintenance_window = ["${var.maintenance_window}"]
  }

  node_config {
    service_account = "${data.google_service_account.primary.email}"
  }
}
