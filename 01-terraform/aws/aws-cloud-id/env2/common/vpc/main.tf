
# ==============================
# Define our vpc */
# ==============================
module "vpc" {
    source = "../../../../../modules/stage/vpc"

    #env       = "${var.env}"
    vpc_env   = "${var.vpc_env}"
    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"

    route53_main = "${var.route53_main}"

    cidr_prefix  = "${var.cidr_prefix}"
    number_of_zones = "${var.number_of_zones}"

   permanent_ip_ids = [ "${data.terraform_remote_state.permanent_ips.outgoing_eip_ids}" ]
}
