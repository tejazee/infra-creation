###create a random generated password to use in secrets.

resource "random_password" "password" {
  length           = 16
  special          = false
  override_special = "!#$@/&*()-_=+[]{}<>:?"
}

# Creating a AWS secret for database master account (Masteraccoundb)

resource "aws_secretsmanager_secret" "secretmasterDB" {
   name = "${var.identifier}-self-dev"
}

# Creating a AWS secret versions for database master account (RDSdbsecret)

resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id = aws_secretsmanager_secret.secretmasterDB.id
  secret_string = <<EOF
   {
    "username": "zee5rdsadmin",
    "password": "${random_password.password.result}"
   }
EOF
}

# Importing the AWS secrets created previously using arn.

data "aws_secretsmanager_secret" "secretmasterDB" {
  arn = aws_secretsmanager_secret.secretmasterDB.arn
}

# Importing the AWS secret version created previously using arn.

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = data.aws_secretsmanager_secret.secretmasterDB.arn
}

# After importing the secrets storing into Locals

locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}