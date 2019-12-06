locals {
  sg_id = concat(
    aws_security_group.sg.*.id,
    [""],
  )[0]
}

resource "aws_security_group" "sg" {
  count  = var.create ? 1 : 0
  name   = var.name
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "ingress_rule_http" {
  count             = var.create_ingress_rule ? 1 : 0
  security_group_id = local.sg_id
  type              = "ingress"
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = "tcp"
  source_security_group_id = var.source_security_group_id[count.index]
}

resource "aws_security_group_rule" "egress" {
  security_group_id = local.sg_id
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
