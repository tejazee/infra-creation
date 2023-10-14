variable "identifier" {
  description = "The name of the identifier"
  type = string
  # validation {
  #   condition  = lower(var.identifier)
  #   error_message = "Unsupported DB identifier name. please use lower case"
  # }
}
variable "engine" {
  description = "The name of the engine"
  default = "postgres"
}
variable "engine_version" {
  description = "The name of the engine_version"
  default = "14.7"
}
 
variable "instance_class" {
  description = "The name of the instance_class"
}
 
variable "allocated_storage" {
  description = "The name of the allocated_storage"
  default = 20
}
 
variable "storage_type" {
  description = "The name of the storage_type"
  default = "gp2"
}
 
variable "storage_encrypted" {
  description = "The name of the storage_encrypted"
  default = "true"
}
# variable "db_subnet_group_name" {
#   description = "The name of the db_subnet_group_name"
# }
 
variable "license_model" {
  description = "The name of the license_model"
  default  = null
}
 
variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot"
  default  = null
}
 
variable "db_name" {
  description = "A short name"
  type     = string
}
 
# variable "username" {
#   description = "The name of the username"
# }
 
# variable "password" {
#   description = "The name of the password"
# }
 
variable "port" {
  description = "The name of the port"
  default = "5432"
}
# variable "enabled_cloudwatch_logs_exports" {
#   description = "The name of the port"
# }
variable "max_allocated_storage" {
  description = "The name of the port"
  default = 100
}
variable "iam_database_authentication_enabled" {
  description = "The name of the iam_database_authentication_enabled"
  default  = null
}
 
# variable "vpc_security_group_ids" {
#   description = "The name of the vpc_security_group_ids"
# }
 
# variable "parameter_group_name" {
#   description = "The name of the vpc_security_group_ids"
# }
 
# variable "vpc_id" {
#   description = "The name of the vpc_id"
# }
variable "vpc_name" {
  description = "The name of the vpc_id"
  default = "zee5-Dev-poc-vpc1"
}
variable "multi_az" {
  description = "The name of the multi_az"
  default  = false
}
 
variable "iops" {
  description = "The name of the iops"
  default  = null
}
 
variable "publicly_accessible" {
  description = "The name of the publicly_accessible"
  default  = false
}
 
variable "allow_major_version_upgrade" {
  description = "The name of the allow_major_version_upgrade"
  default  = false
}
 
variable "performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled"
  default = false
}
 
variable "auto_minor_version_upgrade" {
  description = "The name of the auto_minor_version_upgrade"
  default  = false
}
 
variable "apply_immediately" {
  description = "The name of the apply_immediately"
  default  = true
}
 
variable "maintenance_window" {
  description = "The name of the maintenance_window"
  type     = string
  default  = null
}
 
variable "skip_final_snapshot" {
  description = "The name of the skip_final_snapshot"
  default = false
}
 
#variable "copy_to_snapshot" {
#description = "The name of the copy_tags_to_snapshot"
#default  = null
#}
 
variable "backup_retention_period" {
  description = "The name of the backup_retention_period"
  default = 7
}
 
variable "backup_window" {
  description = "The name of the backup_window"
  default  = null
}
 
variable "character_set_name" {
  description = "The name of the character_set_name"
  default  = null
}
 
variable "deletion_protection" {
  description = "The name of the deletion_protection"
  default  = false
}
 
variable "performance_insights_kms_key_id" {
  description = "The ARN for the KMS key to encrypt Performance Insights data"
  default  = null
}
 
variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false."
  default  = null
}
variable "tags" {
  type = map(string)
  default = {
    # contact-email  = var.contact-email
    # cost-center    = var.cost-center
    # app-name    = var.app-name
    # team-name   = var.team-name
    # created-by     = var.created-by
    #  environment    = "dev"
    # jira-request      = var.jira-request
   #created-date   = timestamp()
   # resource-function = "database"
   # machine-type   = "rds"
  }
}
variable "kms_key_id" {
   description = "key id require for encryption"
   default = "arn:aws:kms:ap-south-1:387911087127:key/0c241555-ae1c-4519-bda4-c9a894c47b4d"
}
variable "region" {
   description = "region to deploy resource"
   default = "ap-south-1"
}
variable "account_id_dev" {
   description = "aws dev account"
}
# variable "account_id_cicd" {
#    description = "aws cicd account"
# }
# variable "cidr_blocks_dev" {
#    description = "vpc cidr"
# }
# variable "cidr_blocks_cicd" {
#    description = "vpc cidr"
# }
###############################################dbsubnet
#variable "name" {
#  description = "Creates a unique name beginning with the specified prefix"
#}
 
variable "description" {
  description = "Description"
  default = "Subnet group for RDS"
}
 
# variable "subnet_ids" {
#   description = "Subnet ids"
# }
###################################################parametergroup
variable "family" {
  description = "The family of the DB parameter group"
  default = "postgres14"
}
###############################################################tags
# variable "leadership-spoc" {}
# variable "cost-center" {}
# variable "service-family" {}
# variable "service-name" {}
# variable "service-owner" {}
# variable "db-instance" {}
# variable "jira-request" {}
variable "environment" {
  description = "tag for machin type"
  default = "dev"
}
variable "deployment-region" {
  type = string
  description = "tag for region"
  default = "ap-south-1"
}
variable "account" {
  type = number
  description = "tag for aws account"
  default = "387911087127"
}
variable "machine-type" {
  description = "tag for machin type"
  default = "rds"
}