variable "vpc_env"    {}
variable "vpc_id"     {}
variable "env"        {}	
variable "service"    {}
variable "branch"     {}	
variable "track"      {}	
variable "project"    {}	
variable "CostGroup"  {}	

variable "alb_arn"          {}	
variable "app_port"        {}
variable "listener_port"   {}
variable "ssl_certificate_arn" {}
variable "register_instance_ids"    { type = "list" }
variable "number_of_instances" {}
