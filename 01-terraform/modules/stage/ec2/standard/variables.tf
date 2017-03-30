variable vpc_to_use {}
variable "aws_region" {}

variable zones { default = [ "a","b","c" ] }

variable "env" {}
variable "vpc_env" {}
variable "project" {}
variable "CostGroup" {}
variable "role" {}

variable "branch" {}
variable "track" {}

variable "ssh_key_name" {}

variable "number_of_zones" {}

variable "number_of_instances" {}
variable "ami" {}
variable "instance_type" {}
variable "public_ip" {}
variable "extra_disk_size" {}

variable "security_group_ids" { type = "list" }
#variable "vpc_subnet_ids" { type = "list" }
variable "subnets" { type = "list" }
variable "instance_profile" {}

variable "dns_zone_id" {}
variable "route53_zone" {}

variable "user_data_file" {}
