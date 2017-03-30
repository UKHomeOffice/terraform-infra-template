# ==============================
# Define the repos IAM roles
# ==============================
module "repos" {
    source = "../../../../../modules/stage/iam"

    role_name = "repos"
   
    vpc_env   = "${var.vpc_env}"
}

output "repos_instance_profile_id" {
  value = "${module.repos.instance_profile_id}"
}
output "repos_instance_profile_arn" {
  value = "${module.repos.instance_profile_arn}"
}
output "repos_instance_profile_path" {
  value = "${module.repos.instance_profile_path}"
}
