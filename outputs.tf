output "mongodb_atlas_root_password" {
  value = mongodbatlas_database_user.root.password
  description = "The root password for logging in to the database."
  sensitive   = true
}

output "mongodb_atlas_mongo_uri" {
  value = local.mongodb_atlas_is_tenant ? mongodbatlas_cluster.tenant_provider.0.mongo_uri : mongodbatlas_cluster.mongodb_atlas.0.mongo_uri
  description = "Base connection string for the cluster"
  sensitive   = true
}

output "mongodb_atlas_mongo_uri_with_options" {
  value = local.mongodb_atlas_is_tenant ? mongodbatlas_cluster.tenant_provider.0.mongo_uri_with_options : mongodbatlas_cluster.mongodb_atlas.0.mongo_uri_with_options
  description = "Includes the replicaSet, ssl, and authSource in the connection string."
  sensitive   = true
}

output "mongodb_atlas_connection_strings" {
  value = local.mongodb_atlas_is_tenant ? mongodbatlas_cluster.tenant_provider.0.connection_strings : mongodbatlas_cluster.mongodb_atlas.0.connection_strings
  description = "Set of connection strings that your applications use to connect"
  sensitive   = true
}

output "mongodb_atlas_cluster_id" {
  value = local.mongodb_atlas_is_tenant ? mongodbatlas_cluster.tenant_provider.0.cluster_id : mongodbatlas_cluster.mongodb_atlas.0.cluster_id
}