
# ==============================
# Define our vpc */
# ==============================
module "feprx_sg" {
    source = "../../../../../modules/stage/sec-groups/feprx_secgroup" 

    vpc_to_use = "${data.terraform_remote_state.vpc.vpc_id}"

    vpc_env   = "${var.vpc_env}"
    env       = "${var.env}"
    role      = "feprx"

    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"

}

output "feprx_sg_id" {
  value = "${module.feprx_sg.sg_id}"
}
