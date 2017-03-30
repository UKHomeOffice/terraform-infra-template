# routing-public.tf

/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "igw-${var.vpc_env}"
    CostCentre = "${var.CostGroup}"
  }
}



/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags {
    Name = "rt-public-${var.vpc_env}"
    CostCentre = "${var.CostGroup}"
  }
}
