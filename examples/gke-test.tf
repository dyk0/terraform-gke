module "vpc" {
  source     = "https://github.com/lucazz/terraform-gcp-network.git"
  project_id = "dope-project"
}

module "gke" {
  source             = "https://github.com/lucazz/terraform-gke.git"
  project_id         = "dope-project"
  service_account_id = "dope-project-service-account"
  vpc_network        = "${module.vpc.vpc_network}"
  vpc_subnetwork     = "${module.vpc.vpc_subnetwork}"
}
