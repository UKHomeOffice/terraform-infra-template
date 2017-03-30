# ========================
# REVERSE-PROXY SG
# ========================
resource "aws_security_group" "whitelist" {
  name = "sg_${var.role}_${var.env}_${var.vpc_env}"
  description = "Permanent Whitelist1 - ${var.env} Security Group"

  vpc_id = "${var.vpc_to_use}"

  # ==== WHITELIST_INBOUND ====
  ingress {
     from_port   = "${var.inbound_port}" 
     to_port     =  "${var.inbound_port}"
     protocol    = "TCP"
     cidr_blocks = "${keys(var.whitelist)}"
  }

#  ingress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     self = "True"
#  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  #tags  =  "${ merge( map( Name,"sg_${var.role}_${var.env}_${var.vpc_env}",  
  #                       env,"${var.env}",  
  #                       role,"${var.role}",  
  #                       CostCentre,"${var.CostGroup}",  
  #                       project,"${var.project}"  
  #                   ),
  #                   var.whitelist 
  #                 ) }"
          
  tags  =  "${var.whitelist}"
          
}

output "sg_id" {
  value = "${aws_security_group.whitelist.id}"
}
