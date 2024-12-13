output "domain_arn" {
  value = aws_ses_domain_identity.domain.*.arn
}

output "template_name" {
  value = aws_ses_email_template.template.*.template_name
}
