[![Maintained by coremaker.io](https://img.shields.io/badge/maintained%20by-coremaker.io-green)](https://coremaker.io/)

# Terraform MongoDB Atlas module

This is a terraform module for MongoDB Atlas which helps you build a project, cluster and a root user.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | 1.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | 1.3.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Resources

| Name | Type |
|------|------|
| [mongodbatlas_cluster.mongodb_atlas](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.3.0/docs/resources/cluster) | resource |
| [mongodbatlas_cluster.tenant_provider](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.3.0/docs/resources/cluster) | resource |
| [mongodbatlas_database_user.root](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.3.0/docs/resources/database_user) | resource |
| [mongodbatlas_project.project](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.3.0/docs/resources/project) | resource |
| [mongodbatlas_project_ip_access_list.services_whitelist](https://registry.terraform.io/providers/mongodb/mongodbatlas/1.3.0/docs/resources/project_ip_access_list) | resource |
| [random_password.mongodb_atlas_root_user_pass](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.mongodb_atlas_cluster_random_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mongodb_atlas_disk_size"></a> [mongodb\_atlas\_disk\_size](#input\_mongodb\_atlas\_disk\_size) | Capacity, in gigabytes, of the host’s root volume | `number` | `2` | no |
| <a name="input_mongodb_atlas_instance_size_name"></a> [mongodb\_atlas\_instance\_size\_name](#input\_mongodb\_atlas\_instance\_size\_name) | The mongodbatlas instance size. Possible values are: M2, M5, M10, M20, M30 etc. | `string` | `"M2"` | no |
| <a name="input_mongodb_atlas_org_id"></a> [mongodb\_atlas\_org\_id](#input\_mongodb\_atlas\_org\_id) | The ID of the organization you want to create the project within. | `any` | n/a | yes |
| <a name="input_mongodb_atlas_project_name"></a> [mongodb\_atlas\_project\_name](#input\_mongodb\_atlas\_project\_name) | The name of the project you want to create. | `any` | n/a | yes |
| <a name="input_mongodb_atlas_region"></a> [mongodb\_atlas\_region](#input\_mongodb\_atlas\_region) | Physical location of your MongoDB cluster | `string` | `"WESTERN_EUROPE"` | no |
| <a name="input_mongodb_atlas_version"></a> [mongodb\_atlas\_version](#input\_mongodb\_atlas\_version) | Version of the cluster to deploy. | `string` | `"4.4"` | no |
| <a name="input_mongodb_auto_scaling_disk_gb_enabled"></a> [mongodb\_auto\_scaling\_disk\_gb\_enabled](#input\_mongodb\_auto\_scaling\_disk\_gb\_enabled) | Specifies whether disk auto-scaling is enabled. | `bool` | `false` | no |
| <a name="input_mongodb_ip_whitelist"></a> [mongodb\_ip\_whitelist](#input\_mongodb\_ip\_whitelist) | Single IP address to be added to the access list. Mutually exclusive with awsSecurityGroup and cidrBlock | `string` | `"0.0.0.0/0"` | no |
| <a name="input_mongodb_provider_backup_enabled"></a> [mongodb\_provider\_backup\_enabled](#input\_mongodb\_provider\_backup\_enabled) | Flag indicating if the cluster uses Cloud Backup for backups. | `bool` | `true` | no |

## Outputs
All outputs are marked as sensitive and will not be shown on terraform plans.

| Name | Description |
|------|-------------|
| <a name="output_mongodb_atlas_cluster_id"></a> [mongodb\_atlas\_cluster\_id](#output\_mongodb\_atlas\_cluster\_id) | Returns the cluster id. |
| <a name="output_mongodb_atlas_cluster_name"></a> [mongodb\_atlas\_cluster\_name](#output\_mongodb\_atlas\_cluster\_name) | Returns the cluster name. |
| <a name="output_mongodb_atlas_connection_strings"></a> [mongodb\_atlas\_connection\_strings](#output\_mongodb\_atlas\_connection\_strings) | Set of connection strings that your applications use to connect |
| <a name="output_mongodb_atlas_mongo_uri"></a> [mongodb\_atlas\_mongo\_uri](#output\_mongodb\_atlas\_mongo\_uri) | Base connection string for the cluster |
| <a name="output_mongodb_atlas_mongo_uri_with_options"></a> [mongodb\_atlas\_mongo\_uri\_with\_options](#output\_mongodb\_atlas\_mongo\_uri\_with\_options) | Includes the replicaSet, ssl, and authSource in the connection string. |
| <a name="output_mongodb_atlas_project_id"></a> [mongodb\_atlas\_project\_id](#output\_mongodb\_atlas\_project\_id) | Returns the project id. |
| <a name="output_mongodb_atlas_root_password"></a> [mongodb\_atlas\_root\_password](#output\_mongodb\_atlas\_root\_password) | The root password for logging in to the database. |

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