module "composer" {
  source = "./airflow_composer"

  cluster_name = "composer-test"

  gcp_project_id = var.project
  gcp_region     = var.region
  gcp_zone       = var.zone

  nodes_machine_type = "n1-standard-1"
  node_count         = 3

  vpc_network_name    = "default"
  subnet_network_name = "default"

  web_server_machine_type = "composer-n1-webserver-2"
  database_machine_type   = "db-n1-standard-2"
}
