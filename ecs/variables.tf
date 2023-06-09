variable "ecsclustername"{
    type= string
}

variable "tags"{
    type= map(any)
}

variable "family"{
    type=string
}

variable "network_mode"{
    type=string
}

variable "required_compatability" {
  type=string
}

variable "role_name"{
    type= string
}

variable "policy_arn" {
  type=string
}

variable "subnets" {
  type=list(any)
}

variable "security_groups" {
  type=list(any)
}