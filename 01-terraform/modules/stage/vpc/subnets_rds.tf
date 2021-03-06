
/* Private subnets */
resource "aws_subnet" "rds" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.cidr_prefix}.${var.rds_subnets[count.index]}"
  availability_zone = "${var.azones[count.index]}"
  depends_on = ["aws_nat_gateway.nat"]
  tags { 
    Name = "sn-rds${count.index}-${var.vpc_env}-${var.letters[count.index]}" 
    vpc  = "${var.vpc_env}"
    env  = "common"
    CostCentre = "${var.CostGroup}"
  }
  count = "${var.number_of_zones}"
}


/* Associate the routing table to the subnet */
resource "aws_route_table_association" "nat_rds" {
  subnet_id = "${element(aws_subnet.rds.*.id,count.index)}"
  route_table_id = "${element(aws_route_table.nat.*.id,count.index)}"
  count = "${var.number_of_zones}"
}
