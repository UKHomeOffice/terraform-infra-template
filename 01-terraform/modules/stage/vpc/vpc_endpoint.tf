resource "aws_vpc_endpoint" "private-s3" {
    vpc_id = "${aws_vpc.vpc.id}"
    service_name = "com.amazonaws.eu-west-1.s3"
    route_table_ids = [ "${aws_route_table.public.id}", "${aws_route_table.nat.*.id}" ]
}

output vpc_endpoint_id {
  value = "${aws_vpc_endpoint.private-s3.id}"
}
