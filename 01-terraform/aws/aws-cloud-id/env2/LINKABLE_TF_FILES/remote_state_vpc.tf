# ========================================
#  Remote State for the VPC and Subnets
# ========================================
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "${var.aws_bucket}"
    profile = "${var.aws_profile}"
    key = "${var.providers_key_prefix}/vpc-${var.vpc_env}/common/vpc/terraform.tfstate"
    region = "${var.aws_region}"
  }
}
