resource "mongodbatlas_project_invitation" "each" {
    for_each = var.mongodbatlas_access
    username    = each.value.name
    project_id  = mongodbatlas_project.project.id
    roles       = each.value.roles
}