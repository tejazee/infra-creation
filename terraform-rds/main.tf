resource "aws_db_subnet_group" "this" {
  count = var.create ? 1 : 0

  name        = local.name
  #name_prefix = local.name_prefix
  description = local.description
  subnet_ids  = var.subnet_ids

  tags = {
    var.tags,
  }
}

resource "aws_security_group" "this" {
  count = var.create && var.create_security_group ? 1 : 0

  name        = var.security_group_name
  #name_prefix = var.security_group_name_prefix
  description = var.security_group_description
  vpc_id      = var.vpc_id
  revoke_rules__on_delete = true

  tags = merge(
    var.tags,
    var.security_group_tags,
    { "Name" = try(coalesce(var.security_group_name, var.security_group_name_prefix), "") },
  )

resource "aws_security_group_rule" "sg1" {
  # Required
  security_group_id = aws_security_group.this[0].id
  protocol          = try(each.value.protocol, "tcp")
  from_port         = try(each.value.from_port, 443)
  to_port           = try(each.value.to_port, 443)
  type              = try(each.value.type, "ingress")
  description              = try(each.value.description, null)
  cidr_blocks              = lookup(each.value, "cidr_blocks", null)
}

resource "aws_security_group_rule" "sg2" {
  # Required
  security_group_id = aws_security_group.this[0].id
  protocol          = try(each.value.protocol, "tcp")
  from_port         = try(each.value.from_port, 443)
  to_port           = try(each.value.to_port, 443)
  type              = try(each.value.type, "ingress")
  description              = try(each.value.description, null)
  cidr_blocks              = lookup(each.value, "cidr_blocks", null)
}


resource "aws_db_parameter_group" "this" {
  count = var.create ? 1 : 0

  name        = local.name
#   name_prefix = local.name_prefix
#   description = local.description
  family      = var.family

  tags = {
    var.tags,
  }
}

resource "aws_db_instance" "this" {
  count = var.create ? 1 : 0

  identifier        = local.identifier
  #dentifier_prefix = local.identifier_prefix

  engine            = local.is_replica ? null : var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = local.is_replica ? null : var.allocated_storage
  storage_type      = var.storage_type
  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id
  license_model     = var.license_model

  db_name                             = var.db_name
  username                            = !local.is_replica ? var.username : null
  password                            = !local.is_replica && var.manage_master_user_password ? null : var.password
  port                                = var.port
#   domain                              = var.domain
#   domain_iam_role_name                = var.domain_iam_role_name
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  custom_iam_instance_profile         = var.custom_iam_instance_profile
  manage_master_user_password         = !local.is_replica && var.manage_master_user_password ? var.manage_master_user_password : null
  master_user_secret_kms_key_id       = !local.is_replica && var.manage_master_user_password ? var.master_user_secret_kms_key_id : null

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  parameter_group_name   = var.parameter_group_name
  option_group_name      = var.option_group_name
  network_type           = var.network_type

  availability_zone   = var.availability_zone
  multi_az            = var.multi_az
  iops                = var.iops
  storage_throughput  = var.storage_throughput
  publicly_accessible = var.publicly_accessible
  ca_cert_identifier  = var.ca_cert_identifier

  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  maintenance_window          = var.maintenance_window


  snapshot_identifier       = var.snapshot_identifier
  copy_tags_to_snapshot     = var.copy_tags_to_snapshot
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = local.final_snapshot_identifier

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null
  performance_insights_kms_key_id       = var.performance_insights_enabled ? var.performance_insights_kms_key_id : null

  replicate_source_db     = var.replicate_source_db
  replica_mode            = var.replica_mode
  backup_retention_period = length(var.blue_green_update) > 0 ? coalesce(var.backup_retention_period, 1) : var.backup_retention_period
  backup_window           = var.backup_window
  max_allocated_storage   = var.max_allocated_storage
  monitoring_interval     = var.monitoring_interval
  monitoring_role_arn     = var.monitoring_interval > 0 ? local.monitoring_role_arn : null

  character_set_name              = var.character_set_name
  #nchar_character_set_name        = var.nchar_character_set_name
  timezone                        = var.timezone
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  deletion_protection      = var.deletion_protection
 # delete_automated_backups = var.delete_automated_backups
 tags = {
    var.tags,
  }
}