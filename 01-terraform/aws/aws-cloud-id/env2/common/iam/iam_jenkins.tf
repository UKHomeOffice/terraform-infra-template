# ==============================
# Define the jenkins IAM roles
# ==============================
module "jenkins" {
    source = "../../../../../modules/stage/iam"

    role_name = "jenkins"
   
    vpc_env   = "${var.vpc_env}"
}

output "jenkins_instance_profile_id" {
  value = "${module.jenkins.instance_profile_id}"
}
output "jenkins_instance_profile_arn" {
  value = "${module.jenkins.instance_profile_arn}"
}
output "jenkins_instance_profile_path" {
  value = "${module.jenkins.instance_profile_path}"
}
