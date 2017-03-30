# =======================================
#  Register the DNS into the PUBLIC Zone
# =======================================
resource "aws_route53_record" "public-ns" {
    zone_id = "${var.dns_zone_id}"
    name = "${var.service}.${var.route53_zone}"
    type = "CNAME"
    ttl = "30"
    records = [
        "${aws_alb.applb.dns_name}",
    ]
}
