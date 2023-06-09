variable "ecsclustername"{
    type= string
}

variable "tags"{
    type= map(any)
}

variable "cidr_block" {
  type= string
}

variable "sgname" {
  type=string
}

variable "sgdesc" {
  type=string
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