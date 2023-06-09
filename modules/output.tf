output "vp_id"{
    value= module.vpc.vpc_id
}

output "subnet_id"{
    value= module.vpc.subnet_id
}

output "sg_id"{
    value= module.security_group.sg_id
}