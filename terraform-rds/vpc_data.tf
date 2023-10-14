data "aws_vpc" "vpc" {
  filter {
    name  = "tag:name"
    value = [var.vpc_name]
  }
}  

data "aws_subnet" "db_subnet_1" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name  = "tag:name"
    value = [var.vpc_name]
  }
}  

data "aws_subnet" "db_subnet_2" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name  = "tag:name"
    value = [var.vpc_name]
  }
}  