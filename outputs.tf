# Identidades de correo verificadas (dev y prod)
output "email_identities" {
  description = "Lista de identidades de correo verificadas"
  value       = [for email in aws_ses_email_identity.emails : email.email]
}

# Dominio SES (solo para prod)
output "ses_domain_identity_arn" {
  description = "ARN del dominio SES (solo prod)"
  value       = length(aws_ses_domain_identity.domain) > 0 ? aws_ses_domain_identity.domain[0].arn : null
}

output "dkim_tokens" {
  description = "Tokens DKIM para configurar en el DNS (solo prod)"
  value       = length(aws_ses_domain_dkim.dkim) > 0 ? aws_ses_domain_dkim.dkim[0].dkim_tokens : []
}

# Plantilla SES (solo prod)
output "template_name" {
  description = "Nombre de la plantilla SES creada"
  value       = length(aws_ses_template.template) > 0 ? aws_ses_template.template[0].name : null
}
