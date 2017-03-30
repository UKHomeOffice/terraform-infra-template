# ==============================
# Define the application IAM roles
# ==============================
module "application" {
    source = "../../../../../modules/stage/iam"

    role_name = "application"
   
    vpc_env   = "${var.vpc_env}"
}

output "application_instance_profile_id" {
  value = "${module.application.instance_profile_id}"
}
output "application_instance_profile_arn" {
  value = "${module.application.instance_profile_arn}"
}
output "application_instance_profile_path" {
  value = "${module.application.instance_profile_path}"
}
