# ========================
# REVERSE-PROXY SG
# ========================
resource "aws_security_group" "sec_group" {
  name = "sg_${var.role}_${var.branch}_${var.track}_${var.env}_${var.vpc_env}"
  description = "${var.role}-${var.branch}-${var.track} - ${var.env} Security Group"

  vpc_id = "${var.vpc_to_use}"

  # ==== INBOUND STUFF ====
  ingress {
     from_port = "${var.port1}"
     to_port   = "${var.port1}"
     protocol  = "tcp"
     security_groups = [ "${var.enabled_security_groups}" ]
  }

  ingress {
     from_port = "${var.port2}"
     to_port   = "${var.port2}"
     protocol = "tcp"
     security_groups = [ "${var.enabled_security_groups}" ]
  }

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
    Name   = "sg_${var.role}_${var.branch}_${var.track}_${var.env}_${var.vpc_env}"
    env    = "${var.env}"
    role   = "${var.role}"
    branch = "${var.branch}"
    track  = "${var.track}"
    vpc    = "${var.vpc_env}"
    project = "${var.project}"
    CostCentre = "${var.CostGroup}"
  }
}

output "sg_id" {
  value = "${aws_security_group.sec_group.id}"
}
