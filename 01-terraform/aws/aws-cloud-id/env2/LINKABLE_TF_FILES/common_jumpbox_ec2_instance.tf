
# ==============================
# Define our vpc */
# ==============================
module "jumpbox" {
    source              = "../../../../../../modules/stage/ec2/standard" 

    vpc_to_use          = "${data.terraform_remote_state.vpc.vpc_id}"
 
    aws_region          = "${var.aws_region}"

    env                 = "${var.env}"
    vpc_env             = "${var.vpc_env}"
    role                = "jb"

    branch              = "${var.branch}"
    track               = "${var.track}"
  
    ssh_key_name        = "${var.ssh_key_name}"

    security_group_ids  = [ "${data.terraform_remote_state.sec_groups.jumpbox_sg_id}",
                            "${data.terraform_remote_state.sec_groups.common_sg_id}",
                            "${data.terraform_remote_state.wl_sec_groups.ssh1_sg_id}",
                            "${data.terraform_remote_state.wl_sec_groups.ssh2_sg_id}",
                            "${data.terraform_remote_state.wl_sec_groups.sshdaily_sg_id}",
                          ]
    subnets             = [ "${data.terraform_remote_state.vpc.public_subnet_ids}" ]

    ami                 = "${var.amis["jumpbox"]}"
    instance_type       = "${var.instance_types["jumpbox"]}"
    number_of_instances = "${var.number_of_instances["jumpbox"]}"
    extra_disk_size     = "${var.extra_disk["jumpbox"]}" 
    public_ip           = true

    instance_profile    = "${data.terraform_remote_state.instance_profiles.application_instance_profile_id}"

    dns_zone_id         = "${data.terraform_remote_state.vpc.internal_zone_id}"
    route53_zone        = "${var.vpc_env}.vpc.internal"

    user_data_file      = "jumpbox.cloud_init"

    project             = "${var.project}"
    CostGroup           = "${var.CostGroup}"

    number_of_zones     = "${var.number_of_zones}"
}

# =======================================
#  Register the DNS into the PUBLIC Zone
# =======================================
resource "aws_route53_record" "private-ns" {
    zone_id     = "${var.route53_main_zone_id}"
    name        = "jb.${var.route53_main}"
    type        = "A"
    ttl         = "30"
    records     = [
                   "${module.jumpbox.instance_public_ips}"
                  ]

   #count = "${var.number_of_instances["jumpbox"]}"
}

# ========================================
#   Output IP-s
# ========================================
output "jumpbox_private_ips" {
   value = [ "${module.jumpbox.instance_private_ips}" ]
}
output "jumpbox_public_ips" {
   value = [ "${module.jumpbox.instance_public_ips}" ]
}
