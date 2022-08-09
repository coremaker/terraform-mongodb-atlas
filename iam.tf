locals {
  project_users = {
    for username in var.mongodbatlas_access :
    username.name => username
  }
}

resource "mongodbatlas_project_invitation" "each" {
  for_each   = local.project_users
  username   = each.key
  project_id = mongodbatlas_project.project.id
  roles      = each.value.roles
}
