# ========================================
#   Remote State for the SecGroups
# ========================================
data "terraform_remote_state" "sec_groups" {
  backend = "s3"
  config {
    bucket = "${var.aws_bucket}"
    profile = "${var.aws_profile}"
    key = "${var.providers_key_prefix}/vpc-${var.vpc_env}/common/sec-groups/terraform.tfstate"
    region = "${var.aws_region}"
  }
}
