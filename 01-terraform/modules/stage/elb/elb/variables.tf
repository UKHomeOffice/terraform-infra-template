
variable "internal_flag" {}

variable "env" {}
variable "vpc_env" {}
variable "project" {}
variable "CostGroup" {}

variable "branch" {}
variable "track" {}

variable "service" {}

variable "vpc_id" {}

variable "dns_zone_id" {}
variable "route53_zone" {}

variable "security_groups" { type = "list" }
variable "subnets" { type = "list" }
