output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = try(aws_db_instance.this[0].address, null)
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = try(aws_db_instance.this[0].arn, null)
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = try(aws_db_instance.this[0].endpoint, null)
}

output "db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = try(aws_db_instance.this[0].identifier, null)
}
########################################subnet
output "db_subnet_group_id" {
  description = "The RDS Resource ID of this instance"
  value       = try(aws_db_instance.this[0].resource_id, null)
}

output "db_subnet_group_name" {
  description = "The RDS instance status"
  value       = try(aws_db_instance.this[0].status, null)
}
########################################parameter
output "db_parameter_group_id" {
  description = "The database name"
  value       = try(aws_db_instance.this[0].db_name, null)
}

output "db_parameter_group_name" {
  description = "The master username for the database"
  value       = try(aws_db_instance.this[0].username, null)
  sensitive   = true
}
#######################################security-group
output "security_group_id" {
  description = "The database port"
  value       = try(aws_db_instance.this[0].port, null)
}

output "security_group_name" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value       = try(aws_db_instance.this[0].ca_cert_identifier, null)
}

