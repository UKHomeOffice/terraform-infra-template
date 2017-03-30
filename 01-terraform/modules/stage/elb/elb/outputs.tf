output "alb_id" {
  value = "${aws_alb.applb.id}"
}

output "alb_dns" {
  value = "${aws_alb.applb.dns_name}"
}
