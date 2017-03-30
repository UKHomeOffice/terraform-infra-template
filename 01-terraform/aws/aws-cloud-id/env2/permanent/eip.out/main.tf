
# =========================================================
# Permanent Outgoing Elastic IP-s for the NAT instances
#   These IP-s are Whitelisted - DO NOT DESTROY THEM !!!
# =========================================================
resource "aws_eip" "eip_out" {
  count = "${var.number_of_permanent_ips}"
  vpc      = true
}

output "outgoing_eip_ids" {
  value = [ "${aws_eip.eip_out.*.id}" ]
}

output "outgoing_eip_public_ips" {
  value = [ "${aws_eip.eip_out.*.public_ip}" ]
}
