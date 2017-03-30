# =====================================
#  Register the VPC DNS zone 
# =====================================

resource "aws_route53_zone" "internal" {
  name = "${var.vpc_env}.vpc.internal"

  vpc_id = "${aws_vpc.vpc.id}"

  force_destroy = true

  tags {
    VPC = "${var.vpc_env}"
  }
}


output "internal_zone_id" {
   value = "${aws_route53_zone.internal.zone_id}"
}
