# ==============================
# Define our services_proxies */
# ==============================
module "srvprx" {
    source              = "../../../../../../modules/stage/ec2/standard" 

    vpc_to_use          = "${data.terraform_remote_state.vpc.vpc_id}"

    aws_region          = "${var.aws_region}"

    env                 = "${var.env}"
    vpc_env             = "${var.vpc_env}"
    role                = "srvprx"

    branch              = "${var.branch}"
    track               = "${var.track}"
  
    ssh_key_name        = "${var.ssh_key_name}"

    security_group_ids  = [ "${data.terraform_remote_state.sec_groups.services_proxy_sg_id}", 
                             "${data.terraform_remote_state.sec_groups.common_sg_id}" 
                          ]
    subnets             = [ "${data.terraform_remote_state.vpc.public_subnet_ids}" ]

    instance_profile    = "${data.terraform_remote_state.instance_profiles.application_instance_profile_id}"

    ami                 = "${var.amis["srvprx"]}"
    instance_type       = "${var.instance_types["srvprx"]}"
    number_of_instances = "${var.number_of_instances["srvprx"]}"
    extra_disk_size     = "${var.extra_disk["srvprx"]}" 
    public_ip           = true

    dns_zone_id         = "${data.terraform_remote_state.vpc.internal_zone_id}"
    route53_zone        = "${var.vpc_env}.vpc.internal"

    user_data_file      = "srvprx.cloud_init"

    project             = "${var.project}"
    CostGroup           = "${var.CostGroup}"

    number_of_zones     = "${var.number_of_zones}"
}

# =======================================================
#  Register the Services Proxy Instances in the ELB TG
# =======================================================
module "srvprx_attachment" {
    source                = "../../../../../../modules/stage/elb/attachment_https"

    ssl_certificate_arn = "${var.ssl_certificate_arn}"

    vpc_id                = "${data.terraform_remote_state.vpc.vpc_id}"

    app_port              = "${var.app_ports["srvprx"]}"
    listener_port         = 443

    alb_arn               = "${data.terraform_remote_state.elb.servprx_alb_id}"

    env                   = "${var.env}"
    vpc_env               = "${var.vpc_env}"

    service               = "srvprx"
    branch                = "${var.branch}"
    track                 = "${var.track}"
    register_instance_ids = [ "${module.srvprx.instance_ids}" ]
    number_of_instances   = "${var.number_of_instances["srvprx"]}"

    project               = "${var.project}"
    CostGroup             = "${var.CostGroup}"
}


# ========================================
#   Output IP-s
# ========================================
output "srvprx_private_ips" {
   value = [ "${module.srvprx.instance_private_ips}" ]
}
output "srvprx_public_ips" {
   value = [ "${module.srvprx.instance_public_ips}" ]
}
