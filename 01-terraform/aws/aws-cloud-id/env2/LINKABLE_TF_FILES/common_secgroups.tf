
# =====================================
# Define the common security_groups
# =====================================
module "common_sg" {
    source = "../../../../../modules/stage/sec-groups/common_secgroups" 

    vpc_to_use = "${data.terraform_remote_state.vpc.vpc_id}"

    vpc_env   = "${var.vpc_env}"

    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"
}

output "jumpbox_sg_id" {
  value = "${module.common_sg.jumpbox_sg_id}"
}
output "jenkins_sg_id" {
  value = "${module.common_sg.jenkins_sg_id}"
}
output "zabbix_sg_id" {
  value = "${module.common_sg.zabbix_sg_id}"
}
output "services_proxy_sg_id" {
  value = "${module.common_sg.services_proxy_sg_id}"
}
output "vault_sg_id" {
  value = "${module.common_sg.vault_sg_id}"
}
output "common_sg_id" {
  value = "${module.common_sg.common_sg_id}"
}
