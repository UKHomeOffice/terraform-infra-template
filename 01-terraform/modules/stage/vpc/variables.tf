
variable "vpc_env" {}

variable "route53_main" {}

variable "project" {}
variable "CostGroup" {}

variable "cidr_prefix" {}

variable "number_of_zones" {}
variable "permanent_ip_ids" { type = "list" }

variable "azones" { type = "list",
                    default = [ "eu-west-1a","eu-west-1b","eu-west-1c" ]
                  }

variable "letters" { type = "list",
                      default = [ "1a","1b","1c" ]
}

variable "public_subnets" { type = "list",
                            default = [ "1.0/24","101.0/24","201.0/24" ]
                          }

variable "services_subnets" { type = "list" 
                            default = [ "2.0/24","102.0/24","202.0/24" ]
                          }

variable "rds_subnets" { type = "list" 
                            default = [ "3.0/24","103.0/24","203.0/24" ]
                          }
