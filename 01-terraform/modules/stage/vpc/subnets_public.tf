
/* Public subnets */

resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.cidr_prefix}.${var.public_subnets[count.index]}"
  availability_zone = "${var.azones[count.index]}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.igw"]
  tags { 
    Name = "sn-public${count.index}-${var.vpc_env}-${var.letters[count.index]}" 
    vpc  = "${var.vpc_env}"
    env  = "common"
    CostCentre = "${var.CostGroup}"
  }
  count = "${var.number_of_zones}"
}

/* Associate the routing table to the subnet */
resource "aws_route_table_association" "route_public" {
  subnet_id = "${element(aws_subnet.public.*.id,count.index)}"
  route_table_id = "${aws_route_table.public.id}"
  count = "${var.number_of_zones}"
}
