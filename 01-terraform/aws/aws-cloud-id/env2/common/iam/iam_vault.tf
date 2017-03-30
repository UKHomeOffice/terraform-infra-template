# ==============================
# Define the repos IAM roles
# ==============================
module "vault" {
    source = "../../../../../modules/stage/iam"

    role_name = "vault"
   
    vpc_env   = "${var.vpc_env}"
}

output "vault_instance_profile_id" {
  value = "${module.vault.instance_profile_id}"
}
output "vault_instance_profile_arn" {
  value = "${module.vault.instance_profile_arn}"
}
output "vault_instance_profile_path" {
  value = "${module.vault.instance_profile_path}"
}
