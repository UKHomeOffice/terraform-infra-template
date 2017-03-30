output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_ids" {
  value = [ "${aws_subnet.public.*.id}" ]
}

output "services_subnet_ids" {
  value = [ "${aws_subnet.services.*.id}" ]
}

output "rds_subnet_ids" {
  value = [ "${aws_subnet.rds.*.id}" ]
}

output "route_nat_ids" {
  value = [ "${aws_route_table.nat.*.id}" ]
}

output "rds_sng_name" {
  value = [ "${aws_db_subnet_group.rds.name}" ]
}
