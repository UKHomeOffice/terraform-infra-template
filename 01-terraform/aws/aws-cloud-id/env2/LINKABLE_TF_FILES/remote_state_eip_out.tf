data "terraform_remote_state" "permanent_ips" {
  backend = "s3"
  config {
    bucket  = "${var.aws_bucket}"
    profile = "${var.aws_profile}"
    key = "${var.providers_key_prefix}/vpc-${var.vpc_env}/permanent/eip.out/terraform.tfstate"
    region = "${var.aws_region}"
  }
}
