# ========================
# JUMPBOX SG
# ========================
resource "aws_security_group" "jumpbox" {
  name = "sg_jumpbox_${var.vpc_env}"
  description = "Jumpbox Servers"

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
    Name = "sg_jumpbox_${var.vpc_env}"
    vpc = "${var.vpc_env}"
    project = "${var.project}"
    CostCentre = "${var.CostGroup}"
  }
}


output "jumpbox_sg_id" {
  value = "${aws_security_group.jumpbox.id}"
}
