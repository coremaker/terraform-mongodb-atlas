resource "random_string" "mongodb_atlas_cluster_random_name" {
  length = 4
  special = false
  upper = false
}

resource "random_password" "mongodb_atlas_root_user_pass" {
  length = 24
  special = false
}