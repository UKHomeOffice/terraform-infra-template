# ========================
# JENKINS SG
# ========================
resource "aws_security_group" "jenkins" {
  name = "sg_jenkins_${var.vpc_env}"
  description = "Jenkins Boxes"

  vpc_id = "${var.vpc_to_use}"

  ingress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     self = "True"
  }

  ingress {
     from_port = 8080
     to_port = 8080
     protocol = "tcp"
     security_groups = [ "${aws_security_group.services_proxy.id}" ]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "sg_jenkins_${var.vpc_env}"
    vpc = "${var.vpc_env}"
    project = "${var.project}"
    CostCentre = "${var.CostGroup}"
  }
}

output "jenkins_sg_id" {
  value = "${aws_security_group.jenkins.id}"
}
