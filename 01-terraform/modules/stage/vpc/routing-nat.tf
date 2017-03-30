
/* Elastic IP-s for the NAT instances */

/* NAT Gateways for the Private Subnets */
resource "aws_nat_gateway" "nat" {
    allocation_id = "${element(var.permanent_ip_ids,count.index)}"
    subnet_id = "${element(aws_subnet.public.*.id,count.index)}"
    depends_on = ["aws_internet_gateway.igw"]
    count = "${var.number_of_zones}"
}


/* Routing table for private subnet */
resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${element(aws_nat_gateway.nat.*.id,count.index)}"
  }
  tags {
    Name = "rt-private${count.index}-${var.vpc_env}-${var.letters[count.index]}"
    CostCentre = "${var.CostGroup}"
  }
  count = "${var.number_of_zones}"
}

