# Create a new load balancer
resource "aws_alb" "applb" {
  name            = "elb-${var.service}-${var.branch}-${var.track}-${var.env}-${var.vpc_env}"
  internal        = "${var.internal_flag}"

  security_groups = [ "${var.security_groups}" ]
  subnets         = [ "${var.subnets}" ]

  #enable_deletion_protection = true

  tags {
    Name = "elb-${var.service}-${var.branch}-${var.track}-${var.env}_${var.vpc_env}"
    vpc  = "${var.vpc_env}"
    env  = "${var.env}"
    branch = "${var.branch}"
    track  = "${var.track}"
    role   = "${var.service}"
    project  = "${var.project}"
    CostGroup = "${var.CostGroup}"
  }
}

