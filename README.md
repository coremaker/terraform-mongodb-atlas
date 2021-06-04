[![Maintained by coremaker.io](https://img.shields.io/badge/maintained%20by-coremaker.io-green)](https://coremaker.io/)

# Terraform MongoDB Atlas module

This is a terraform module for MongoDB Atlas which helps you build a project, cluster and a root user.

# Outputs
All outputs are marked as sensitive and will not be shown on terraform plans.

* mongodb_atlas_root_password
* mongodb_atlas_mongo_uri
* mongodb_atlas_mongo_uri_with_options
* mongodb_atlas_connection_strings
* mongodb_atlas_cluster_id

# Examples

```terraform
module "mongodb" {
    source = "github.com/coremaker/terraform-mongodb-atlas.git"

    mongodb_atlas_org_id = << org id >>
    mongodb_atlas_project_name = "dev"

    mongodb_atlas_instance_size_name = "M10"
    mongodb_atlas_disk_size = "10"
    mongodb_atlas_version = "4.4"
}

resource "kubernetes_secret" "mongodb_atlas_root_user_secret" {
    metadata {
        name = "mongodb-atlas-root"
        namespace = "default"
    }

    data = {
        username = "root"
        password = module.mongodb.mongodb_atlas_root_password
    }
}
```