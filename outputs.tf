output "vpc_security_group_ids" {
  description = "list of SGs"
  value       = concat(aws_security_group.sg.*.id)
}

output "source_security_group_id" {
  description = "source SG"
  value       = concat(aws_security_group.sg.*.id)
}
