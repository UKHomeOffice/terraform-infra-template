/* Setup our aws provider */
provider "aws" {
  profile = "${var.aws_profile}"
  region      = "${var.aws_region}"
}
