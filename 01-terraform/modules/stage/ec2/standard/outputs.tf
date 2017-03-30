
output "instance_ids" {
  value = [ "${aws_instance.instance.*.id}" ]
}

output "instance_private_ips" {
  value = [ "${aws_instance.instance.*.private_ip}" ]
}

output "instance_public_ips" {
  value = [ "${aws_instance.instance.*.public_ip}" ]
}

output "instance_names" {
  value = [ "${aws_instance.instance.*.Name}" ]
}

output "ebs_ids" {
  value = [ "${aws_ebs_volume.example.*.id}" ]
}

