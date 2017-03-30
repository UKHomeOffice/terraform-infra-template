
# ===============================================
# Create the Target group to attach the machines
# ===============================================
resource "aws_alb_target_group" "target_group" {
  name        = "tg-${var.service}-${var.branch}-${var.track}-${var.env}-${var.vpc_env}"
  port        = "${var.app_port}"
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"
  tags {
    Name      = "tg-${var.service}-${var.branch}-${var.track}-${var.env}-${var.vpc_env}"
    vpc       = "${var.vpc_env}"
    env       = "${var.env}"
    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"
  }
}

# ===============================================
# A Listener attached the ALB
# ===============================================
resource "aws_alb_listener" "listener" {
   load_balancer_arn = "${var.alb_arn}"
   port              = "${var.listener_port}"
   protocol          = "HTTPS"

   ssl_policy        = "ELBSecurityPolicy-2015-05"
   certificate_arn   = "${var.ssl_certificate_arn}"

   default_action {
     target_group_arn = "${aws_alb_target_group.target_group.arn}"
     type = "forward"
   }
}

# =======================================================
#  Register the list of Instances in the Target_group
# =======================================================
resource "aws_alb_target_group_attachment" "app_admin_tg_attachment" {
  target_group_arn = "${aws_alb_target_group.target_group.arn}"
  target_id        = "${element(var.register_instance_ids,count.index)}"
  port             = "${var.app_port}"
  count            = "${var.number_of_instances}"
}

output "tg_arn" {
   value          = "${aws_alb_target_group.target_group.arn}"
}
