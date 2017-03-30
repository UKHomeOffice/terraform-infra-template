/* Define our vpc */
resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_prefix}.0.0/16"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags { 
    Name = "vpc-${var.vpc_env}" 
    project = "${var.project}"
    CostCentre = "${var.CostGroup}"
  }
}
