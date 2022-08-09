locals {
  mongodb_atlas_is_tenant = var.mongodb_atlas_instance_size_name == "M2" || var.mongodb_atlas_instance_size_name == "M5"
}

resource "mongodbatlas_project_ip_access_list" "services_whitelist" {
  project_id = mongodbatlas_project.project.id
  cidr_block = var.mongodb_ip_whitelist
  comment    = "Allow services to connect"
}

resource "mongodbatlas_database_user" "root" {
  username           = "root"
  password           = random_password.mongodb_atlas_root_user_pass.result
  project_id         = mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
  }
}

resource "mongodbatlas_cluster" "tenant_provider" {
  count = local.mongodb_atlas_is_tenant ? 1 : 0

  project_id                   = mongodbatlas_project.project.id
  name                         = "mongodb-${random_string.mongodb_atlas_cluster_random_name.result}"
  auto_scaling_disk_gb_enabled = var.mongodb_auto_scaling_disk_gb_enabled
  mongo_db_major_version       = var.mongodb_atlas_version
  //Provider Settings "block"
  provider_name               = "TENANT"
  backing_provider_name       = "GCP"
  provider_instance_size_name = var.mongodb_atlas_instance_size_name
  disk_size_gb                = var.mongodb_atlas_disk_size
  provider_region_name        = var.mongodb_atlas_region
}

resource "mongodbatlas_cluster" "mongodb_atlas" {
  count = local.mongodb_atlas_is_tenant ? 0 : 1

  project_id                   = mongodbatlas_project.project.id
  name                         = "mongodb-${random_string.mongodb_atlas_cluster_random_name.result}"
  auto_scaling_disk_gb_enabled = var.mongodb_auto_scaling_disk_gb_enabled
  mongo_db_major_version       = var.mongodb_atlas_version
  //Provider Settings "block"
  cloud_backup                = var.mongodb_provider_backup_enabled
  provider_name               = "GCP"
  provider_instance_size_name = var.mongodb_atlas_instance_size_name
  disk_size_gb                = var.mongodb_atlas_disk_size
  provider_region_name        = var.mongodb_atlas_region
}

resource "mongodbatlas_project" "project" {
  name   = var.mongodb_atlas_project_name
  org_id = var.mongodb_atlas_org_id
}
