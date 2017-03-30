# ========================
# REVERSE-PROXY SG
# ========================
resource "aws_security_group" "sec_group" {
  name = "sg_${var.role}_${var.env}_${var.vpc_env}"
  description = "${var.role} - ${var.env} Security Group"

  vpc_id = "${var.vpc_to_use}"

  ingress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     self = "True"
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sg_${var.role}_${var.env}_${var.vpc_env}"
    env  = "${var.env}"
    role = "${var.role}"
    vpc = "${var.vpc_env}"
    project = "${var.project}"
    CostCentre = "${var.CostGroup}"
  }
}

output "sg_id" {
  value = "${aws_security_group.sec_group.id}"
}
