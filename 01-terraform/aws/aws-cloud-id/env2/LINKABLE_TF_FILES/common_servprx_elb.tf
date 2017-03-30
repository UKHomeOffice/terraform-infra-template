
# ==============================
#    Define our ALB
# ==============================
module "servprx_alb" {
    source              = "../../../../../modules/stage/elb/elb" 

    internal_flag       = false

    vpc_id              = "${data.terraform_remote_state.vpc.vpc_id}"
    security_groups     = [ "${data.terraform_remote_state.sec_groups.services_proxy_sg_id}",
                            "${data.terraform_remote_state.wl_sec_groups.perm1_sg_id}",
                            "${data.terraform_remote_state.wl_sec_groups.perm2_sg_id}",
                            "${data.terraform_remote_state.wl_sec_groups.daily_sg_id}"
                          ]
    subnets             = [ "${data.terraform_remote_state.vpc.public_subnet_ids}" ]

    dns_zone_id         = "${var.route53_main_zone_id}"
    route53_zone        = "${var.route53_main}"
 

    env                 = "${var.env}"
    vpc_env             = "${var.vpc_env}"
    project             = "${var.project}"
    CostGroup           = "${var.CostGroup}"
    branch              = "fe"
    track               = "elb"

    service             = "srvprx"
}

# ======================
#  Output LB Data
# ======================
output "servprx_alb_id" {
  value = "${module.servprx_alb.alb_id}"
}
output "servprx_dns_name" {
  value = "${module.servprx_alb.alb_dns}"
}
