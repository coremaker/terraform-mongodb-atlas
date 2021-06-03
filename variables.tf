variable "mongodb_atlas_instance_size_name" {
    default = "M2"
    description = "The mongodbatlas instance size. Possible values are: M2, M5, M10, M20, M30 etc. IMPORTANT: Upgrading from M2/M5 to M10 and above will recreate the cluster and the data will be lost so a data migration must be planned ahead."
}

variable "mongodb_atlas_version" {
    default = "4.4"
}

variable "mongodb_atlas_disk_size" {
    default = 2
}

variable "mongodb_atlas_region" {
    default = "WESTERN_EUROPE"
}

variable "mongodb_atlas_project_name" {
}

variable "mongodb_atlas_org_id" {
}

variable "mongodb_ip_whitelist" {
    default = "0.0.0.0/0"
}

variable "mongodb_provider_backup_enabled" {
    type = bool
    default = true
}

variable "mongodb_auto_scaling_disk_gb_enabled" {
    type = bool
    default = false
}