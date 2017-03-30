# ========================================
#    Remote State for the ALB and ELB
# ========================================
data "terraform_remote_state" "elb" {
  backend = "s3"
  config {
    bucket = "${var.aws_bucket}"
    profile = "${var.aws_profile}"
    key = "${var.providers_key_prefix}/vpc-${var.vpc_env}/${var.env}/elb/terraform.tfstate"
    region = "${var.aws_region}"
  }
}
