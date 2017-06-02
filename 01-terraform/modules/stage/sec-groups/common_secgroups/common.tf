# ===============================
# Common SG Traffic - SSH,Zabbix
# ===============================
resource "aws_security_group" "common" {
  name = "sg_common_${var.vpc_env}"
  description = "Common Traffic"

  vpc_id = "${var.vpc_to_use}"

  ingress {
     from_port = 22
     to_port = 22
     protocol = "tcp"
     security_groups = [ "${aws_security_group.jenkins.id}","${aws_security_group.jumpbox.id}" ]
  }

  ingress {
     from_port =  10050
     to_port = 10052
     protocol = "tcp"
     security_groups = [ "${aws_security_group.zabbix.id}" ]
  }


  tags {
    Name = "sg_common_${var.vpc_env}"
    vpc = "${var.vpc_env}"
    project = "${var.project}"
    CostCentre = "${var.CostGroup}"
  }
}

output "common_sg_id" {
  value = "${aws_security_group.common.id}"
}
