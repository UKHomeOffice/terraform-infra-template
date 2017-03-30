
# ==============================
#    Define our ALB
# ==============================
module "application_subnets" {
    source = "../../../../../modules/stage/subnets" 

    number_of_zones = 3

    subnet_name = "application"

    vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
    route_ids = [ "${data.terraform_remote_state.vpc.route_nat_ids}" ]

    cidr_prefix   = "${var.cidr_prefix}"
    cidr_suffixes = [ "${var.application_subnets}" ]


    env       = "${var.env}"
    vpc_env   = "${var.vpc_env}"
    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"

}


# ======================
#  Output LB Data
# ======================
output "application_subnet_ids" {
  value = [ "${module.application_subnets.subnet_ids}" ]
}
