# GLOBAL VARIABLES FOR THE ACCOUNT
variable "aws_region" {}

variable "aws_profile" {}
variable "aws_bucket" {}

variable "statefile_key_prefix" {}

variable "route53_main" {}
variable "route53_main_zone_id" {}

variable "ssl_certificate_arn" {}

variable "modversion" {}

variable "providers_key_prefix" {}

# ======================
#   Tagging and Naming
# ======================
variable "env" {}
variable "vpc_env" {}
variable "project" {}
variable "CostGroup" {}
variable "Owner" {}

# This is passed in as a command parameter
variable "branch" {}
variable "track" {}

# ========================
#  Network and High Avail
# ========================
variable "cidr_prefix" {}
variable "number_of_zones" {}

# =================================
#  Environment master SSH key
# =================================
variable "ssh_access_key" {}
variable "ssh_key_name" {}

# ============================
# SPECIFIC SETTINGS
# ============================
variable "app_ports" { type = "map" }
variable "amis" { type = "map" }
variable "instance_types" { type = "map" }
variable "number_of_instances" { type = "map" }
variable "extra_disk" { type = "map" }

variable "application_subnets" { type = "list" }
