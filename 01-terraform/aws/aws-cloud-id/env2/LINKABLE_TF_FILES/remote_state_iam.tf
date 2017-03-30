# ============================================
#   Remote State for the Instance Profiles
# ============================================
data "terraform_remote_state" "instance_profiles" {
  backend = "s3"
  config {
    bucket = "${var.aws_bucket}"
    profile = "${var.aws_profile}"
    key = "${var.providers_key_prefix}/vpc-${var.vpc_env}/common/iam/terraform.tfstate"
    region = "${var.aws_region}"
  }
}
