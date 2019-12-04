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

resource "aws_security_group_rule" "ingress_rules" {
  count             = var.create ? length(var.ingress_rules) : 0
  security_group_id = local.sg_id
  type              = "ingress"
  cidr_blocks       = var.cidr_blocks
  from_port         = var.rules[var.ingress_rules[count.index]][0]
  to_port           = var.rules[var.ingress_rules[count.index]][1]
  protocol          = var.rules[var.ingress_rules[count.index]][2]
}
