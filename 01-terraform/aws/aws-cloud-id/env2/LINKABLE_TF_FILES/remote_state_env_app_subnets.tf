# ========================================
#    Remote State for the ALB and ELB
# ========================================
data "terraform_remote_state" "env_subnets" {
  backend = "s3"
  config {
    bucket = "${var.aws_bucket}"
    profile = "${var.aws_profile}"
    key = "providers-common-np/aws/vpc-${var.vpc_env}/${var.env}/subnets/terraform.tfstate"
    region = "${var.aws_region}"
  }
}
