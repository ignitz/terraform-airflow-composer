variable "cluster_name" {
  description = "Name of the environment"
  type        = string
}

variable "gcp_project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "gcp_region" {
  description = "The region in which all GCP resources will be launched."
  type        = string
}

variable "gcp_zone" {
  description = "The zone in which all GCP resources will be launched."
  type        = string
}

variable "nodes_machine_type" {
  description = <<EOF
  The Compute Engine machine type used for cluster instances, specified as
  a name or relative resource name. For example:
  "projects/{project}/zones/{zone}/machineTypes/{machineType}".
  Must belong to the enclosing environment's project and region/zone.
  EOF
  type        = string
}

variable "node_count" {
  description = "Node count to GKE resources"
  type        = number
}

variable "vpc_network_name" {
  description = <<EOF
  The Compute Engine network to be used for machine communications,
  specified as a self-link, relative resource name
  (e.g. "projects/{project}/global/networks/{network}"), by name.
  EOF
  type        = string
}

variable "subnet_network_name" {
  description = <<EOF
  The Compute Engine subnetwork to be used for machine communications,
  specified as a self-link, relative resource name
  (e.g. "projects/{project}/regions/{region}/subnetworks/{subnetwork}"), or by name.
  If subnetwork is provided, network must also be provided and the subnetwork must
  belong to the enclosing environment's project and region.
  EOF
  type        = string
}

variable "web_server_machine_type" {
  description = <<EOF
  Machine type on which Airflow web server is running.
  It has to be one of:
  composer-n1-webserver-2, composer-n1-webserver-4 or composer-n1-webserver-8.
  EOF
  type        = string

  validation {
    condition = contains(
      ["composer-n1-webserver-2", "composer-n1-webserver-4", "composer-n1-webserver-8"],
      var.web_server_machine_type
    )
    error_message = "Invalid machine type. It has to be one of: composer-n1-webserver-2, composer-n1-webserver-4 or composer-n1-webserver-8."
  }
}

variable "database_machine_type" {
  description = <<EOF
  Cloud SQL machine type used by Airflow database. It has to be one of:
  db-n1-standard-2, db-n1-standard-4, db-n1-standard-8 or db-n1-standard-16.
  EOF
  type        = string

  validation {
    condition = contains(
      ["db-n1-standard-2", "db-n1-standard-4", "db-n1-standard-8", "db-n1-standard-16"],
    var.database_machine_type)
    error_message = "Database Machine Type it has to be one of: db-n1-standard-2, db-n1-standard-4, db-n1-standard-8 or db-n1-standard-16."
  }
}

