
variable "env" {}
variable "vpc_env" {}

variable "vpc_id" {}

variable "project" {}
variable "CostGroup" {}

variable "cidr_prefix" {}

variable "number_of_zones" {}

variable "subnet_name" {}

variable "azones" { type = "list",
                    default = [ "eu-west-1a","eu-west-1b","eu-west-1c" ]
                  }

variable "letters" { type = "list",
                      default = [ "a1","b1","c1" ]
}

variable "cidr_suffixes" { type = "list" }
variable "route_ids" { type = "list" }
