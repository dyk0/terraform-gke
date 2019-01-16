module "vpc" {
  source     = "github.com/lucazz/terraform-gcp-network.git"
  project_id = "dope-project-0000000"
}

module "gke" {
  source             = "github.com/lucazz/terraform-gke.git"
  project_id         = "dope-project-0000000"
  service_account_id = "dope-service-account"
  vpc_network        = "${module.vpc.vpc_network}"
  vpc_subnetwork     = "${module.vpc.vpc_subnetwork}"
}
