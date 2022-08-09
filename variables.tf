# Required

variable "mongodb_atlas_project_name" {
  type        = string
  description = "The name of the project you want to create."
}

variable "mongodb_atlas_org_id" {
  type        = string
  description = "The ID of the organization you want to create the project within."
}

# Defaults

# IMPORTANT: Upgrading from M2/M5 to M10 and above will recreate the cluster and the data will be lost so a data migration must be planned ahead.
variable "mongodb_atlas_instance_size_name" {
  type        = string
  default     = "M2"
  description = "The mongodbatlas instance size. Possible values are: M2, M5, M10, M20, M30 etc."
}

variable "mongodb_atlas_version" {
  type        = string
  default     = "4.4"
  description = "Version of the cluster to deploy."
}

variable "mongodb_atlas_disk_size" {
  type        = number
  default     = 2
  description = "Capacity, in gigabytes, of the host’s root volume"
}

variable "mongodb_atlas_region" {
  type        = string
  default     = "WESTERN_EUROPE"
  description = "Physical location of your MongoDB cluster"
}

variable "mongodb_ip_whitelist" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Single IP address to be added to the access list. Mutually exclusive with awsSecurityGroup and cidrBlock"
}

variable "mongodb_provider_backup_enabled" {
  type        = bool
  default     = true
  description = "Flag indicating if the cluster uses Cloud Backup for backups."
}

variable "mongodb_auto_scaling_disk_gb_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether disk auto-scaling is enabled."
}

variable "mongodbatlas_access" {
  type = list(object({
    name  = string
    roles = set(string)
  }))
  default = [
    {
      name  = ""
      roles = []
    }
  ]
}
