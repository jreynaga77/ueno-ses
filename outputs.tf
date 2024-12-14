# Outputs relacionados con dominio
output "ses_domain_identity_arn" {
  value = aws_ses_domain_identity.domain[0].arn
}

output "dkim_tokens" {
  value = aws_ses_domain_dkim.dkim[0].dkim_tokens
}

# Outputs relacionados con direcciones de correo
output "email_identities" {
  value = aws_ses_email_identity.emails[*].email_identity
}

# Outputs relacionados con plantillas
output "template_name" {
  value = aws_ses_template.template[0].name
}

output "templates" {
  value = [for t in aws_ses_template.templates : t.name]
}
