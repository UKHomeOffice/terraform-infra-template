
/* Private subnets */
resource "aws_subnet" "private" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.cidr_prefix}.${var.cidr_suffixes[count.index]}"
  availability_zone = "${var.azones[count.index]}"
  tags { 
    Name = "sn-${var.subnet_name}${count.index}-${var.env}-${var.vpc_env}-${var.letters[count.index]}" 
    vpc  = "${var.vpc_env}"
    env  = "${var.env}"
    CostCentre = "${var.CostGroup}"
  }
  count = "${var.number_of_zones}"
}


/* Associate the routing table to the subnet */
resource "aws_route_table_association" "nat_private" {
  subnet_id      = "${element(aws_subnet.private.*.id,count.index)}"
  route_table_id = "${element(var.route_ids,count.index)}"
  count          = "${var.number_of_zones}"
}

output "subnet_ids" {
   value = [ "${aws_subnet.private.*.id}" ]
}
