

# =======================================
# Define the First Permanent Whitelist
# =======================================
module "wl_perm1" {
    source       = "../../../../../modules/stage/sec-groups/whitelist_secgroup" 

    vpc_to_use   = "${data.terraform_remote_state.vpc.vpc_id}"


    vpc_env      = "${var.vpc_env}"
    env          = "${var.env}"
    role         = "perm1"

    inbound_port = "443"
    whitelist    = "${var.wl_perm1}"

    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"

}
# =======================================
# Define the Second Permanent Whitelist
# =======================================
module "wl_perm2" {
    source = "../../../../../modules/stage/sec-groups/whitelist_secgroup" 

    vpc_to_use   = "${data.terraform_remote_state.vpc.vpc_id}"

    vpc_env      = "${var.vpc_env}"
    env          = "${var.env}"
    role         = "perm2"

    inbound_port = "443"
    whitelist    = "${var.wl_perm2}"

    project      = "${var.project}"
    CostGroup    = "${var.CostGroup}"

}

# =======================================
# Define the First Permanent Whitelist
# =======================================
module "wl_daily" {
    source = "../../../../../modules/stage/sec-groups/whitelist_secgroup" 

    vpc_to_use   = "${data.terraform_remote_state.vpc.vpc_id}"

    vpc_env      = "${var.vpc_env}"
    env          = "${var.env}"
    role         = "daily"

    inbound_port = "443"
    whitelist    = "${var.wl_daily}"

    project      = "${var.project}"
    CostGroup    = "${var.CostGroup}"

}

output "perm1_sg_id" {
  value = "${module.wl_perm1.sg_id}"
}
output "perm2_sg_id" {
  value = "${module.wl_perm2.sg_id}"
}
output "daily_sg_id" {
  value = "${module.wl_daily.sg_id}"
}
