module "vpc"{
    source = "../vpc"
    cidr_block = var.cidr_block
    tags= var.tags
}

module "security_group" {
    source= "../securitygroup"
    sgdesc = var.sgdesc
    sgname = var.sgname
    vpc_id= module.vpc.vpc_id
    tags= var.tags
}

module "ecs" {
  source = "../ecs"
  ecsclustername = var.ecsclustername
  tags= var.tags
  role_name = var.role_name
  policy_arn = var.policy_arn
  family = var.family
  network_mode = var.network_mode
  required_compatability = var.required_compatability
  subnets = [module.vpc.subnet_id]
  security_groups = [module.security_group.sg_id]
}