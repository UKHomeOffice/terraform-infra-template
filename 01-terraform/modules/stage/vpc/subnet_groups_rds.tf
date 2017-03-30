resource "aws_db_subnet_group" "rds" {
    name = "rds-sng-commondbs-${var.vpc_env}"
    subnet_ids = [ "${aws_subnet.rds.*.id}" ]
    tags {
        Name = "rds-sng-commondbs-${var.vpc_env}"
        vpc  = "${var.vpc_env}"
        env  = "common"
        CostCentre = "${var.CostGroup}"
    }
}
