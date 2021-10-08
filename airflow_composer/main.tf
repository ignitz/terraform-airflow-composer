resource "google_composer_environment" "main" {
  provider = google-beta # must be BETA because of database_config

  name    = var.cluster_name
  region  = var.gcp_region
  project = var.gcp_project_id

  config {
    node_count = var.node_count

    node_config {
      zone         = var.gcp_zone
      machine_type = var.nodes_machine_type

      network    = var.vpc_network_name
      subnetwork = var.subnet_network_name
    }

    web_server_config {
      machine_type = var.web_server_machine_type
    }

    database_config {
      machine_type = var.database_machine_type
    }
  }
}
