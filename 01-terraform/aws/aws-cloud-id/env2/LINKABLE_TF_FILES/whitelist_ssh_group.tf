# =======================================
# Define the First Permanent Whitelist
# =======================================
module "ssh_perm1" {
    source       = "../../../../../modules/stage/sec-groups/whitelist_secgroup" 

    vpc_to_use   = "${data.terraform_remote_state.vpc.vpc_id}"


    vpc_env      = "${var.vpc_env}"
    env          = "${var.env}"
    role         = "ssh1"

    inbound_port = "22"
    whitelist    = "${var.wl_perm1}"

    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"

}
# =======================================
# Define the Second Permanent Whitelist
# =======================================
module "ssh_perm2" {
    source = "../../../../../modules/stage/sec-groups/whitelist_secgroup" 

    vpc_to_use   = "${data.terraform_remote_state.vpc.vpc_id}"

    vpc_env      = "${var.vpc_env}"
    env          = "${var.env}"
    role         = "ssh2"

    inbound_port = "22"
    whitelist    = "${var.wl_perm2}"

    project      = "${var.project}"
    CostGroup    = "${var.CostGroup}"

}

# =======================================
# Define the First Permanent Whitelist
# =======================================
module "ssh_daily" {
    source = "../../../../../modules/stage/sec-groups/whitelist_secgroup" 

    vpc_to_use   = "${data.terraform_remote_state.vpc.vpc_id}"

    vpc_env      = "${var.vpc_env}"
    env          = "${var.env}"
    role         = "ssh_daily"

    inbound_port = "22"
    whitelist    = "${var.wl_daily}"

    project      = "${var.project}"
    CostGroup    = "${var.CostGroup}"

}

output "ssh1_sg_id" {
  value = "${module.ssh_perm1.sg_id}"
}
output "ssh2_sg_id" {
  value = "${module.ssh_perm2.sg_id}"
}
output "sshdaily_sg_id" {
  value = "${module.ssh_daily.sg_id}"
}
