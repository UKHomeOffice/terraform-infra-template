# =======================================
#  Register the DNS into the PRIVATE Zone
# =======================================
resource "aws_route53_record" "private-ns" {
    zone_id = "${var.dns_zone_id}"
    name = "${var.role}${count.index}.${var.branch}-${var.track}.${var.env}.${var.route53_zone}"
    type = "A"
    ttl = "30"
    records = [
        "${element(aws_instance.instance.*.private_ip,count.index)}",
    ]

   count = "${var.number_of_instances}"
}
