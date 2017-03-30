
# ==============================
#    Define the vault server
# ==============================
module "vault" {
    source = "../../../../../../modules/stage/ec2/standard" 

    vpc_to_use = "${data.terraform_remote_state.vpc.vpc_id}"

    aws_region = "${var.aws_region}"

    env       = "${var.env}"
    vpc_env   = "${var.vpc_env}"
    role      = "vault"

    branch    = "${var.branch}"
    track     = "${var.track}"
  
    ssh_key_name       = "${var.ssh_key_name}"

    security_group_ids = [ "${data.terraform_remote_state.sec_groups.vault_sg_id}", "${data.terraform_remote_state.sec_groups.common_sg_id}" ]
    subnets = [ "${data.terraform_remote_state.vpc.services_subnet_ids}" ]

    ami                 = "${var.amis["vault"]}"
    instance_type       = "${var.instance_types["vault"]}"
    number_of_instances = "${var.number_of_instances["vault"]}"
    extra_disk_size     = "${var.extra_disk["vault"]}" 
    public_ip           = false

    instance_profile    = "${data.terraform_remote_state.instance_profiles.vault_instance_profile_id}"

    dns_zone_id         = "${data.terraform_remote_state.vpc.internal_zone_id}"
    route53_zone        = "${var.vpc_env}.vpc.internal"

    user_data_file      = "vault.cloud_init"

    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"

    number_of_zones = "${var.number_of_zones}"
}


# ========================================
#   Output IP-s
# ========================================
output "vault_private_ips" {
   value = [ "${module.vault.instance_private_ips}" ]
}
