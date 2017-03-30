# ========================
# VAULT SG
# ========================
resource "aws_security_group" "vault" {
  name = "sg_vault_${var.vpc_env}"
  description = "Vault Servers"

  vpc_id = "${var.vpc_to_use}"

  # ENABLE TRAFFIC FROM ALL INSTANCES TO THE VAULT
  ingress {
     from_port = 8080
     to_port = 8080
     protocol = "TCP"
     cidr_blocks = ["0.0.0.0/0"]
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
    Name = "sg_vault_${var.vpc_env}"
    vpc = "${var.vpc_env}"
    project = "${var.project}"
    CostCentre = "${var.CostGroup}"
  }
}

output "vault_sg_id" {
  value = "${aws_security_group.vault.id}"
}
