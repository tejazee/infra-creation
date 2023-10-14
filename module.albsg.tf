module "sg_alb" {
  source = "git@github.com:ZEE-5/z5x-terraform-aws-modules.git//aws_security_group?ref=master"
  name   = "${var.name}-${var.environment}-alb"
  tags   = var.tags
  vpc_id = module.vpc.vpc_id
  Account             = var.Account
  Environment         = var.Environment
  Cluster-Name         = var.Cluster-Name
  Deployment-pipeline = var.Deployment-pipeline
  Cluster-Type        = var.Cluster-Type
  Security-Agents     = var.Security-Agents
  Monitoring-Agents   = var.Monitoring-Agents
  Deployment-Region   = var.Deployment-Region
  Created-by          = var.Created-by
  Cost-Center         = var.Cost-Center
  Service-Owner        = var.Service-Owner
  Leadership-Spoc      = var.Leadership-Spoc
  Service-Name        = var.Service-Name
  Service-Family      = var.Service-Family
}
# module "sg_ingress_outside_ipv4_alb" {
#   source            = "git@github.com:ZEE-5/z5x-terraform-aws-modules.git//aws_security_group_ingress?ref=master"
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Allow 80 and 443"
#   ports             = [443, 80]
#   protocol          = "TCP"
#   security_group_id = module.sg_alb.sg_id
#   tags              = var.tags
# }
# module "sg_ingress_outside_ipv6_alb" {
#   source            = "git@github.com:ZEE-5/z5x-terraform-aws-modules.git//aws_security_group_ingress_ipv6?ref=master"
#   ipv6_cidr_blocks  = ["::/0"]
#   description       = "Allow 80 and 443"
#   ports             = [443, 80]
#   protocol          = "TCP"
#   security_group_id = module.sg_alb.sg_id
#   tags              = var.tags
# }
module "sg_egress_alb" {
  source            = "git@github.com:ZEE-5/z5x-terraform-aws-modules.git//aws_security_group_egress?ref=master"
  security_group_id = module.sg_alb.sg_id
}
module "data_sg_akamai" {
  source      = "git@github.com:ZEE-5/z5x-terraform-aws-modules.git//aws_security_group_data_akamai?ref=master"
  Name        = "Akamai-site-shield-SG"
  Environment = "Production"
}
