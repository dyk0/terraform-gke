data "google_service_account" "primary" {
  account_id = "${var.service_account_id}"
  project    = "${var.project_id}"
}
