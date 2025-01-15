# output "email_identities" {
#   description = "Lista de identidades de correo verificadas"
#   value       = [for email in aws_ses_email_identity.emails : email.email]
# }

# output "ses_domain_identity_arn" {
#   description = "ARN del dominio SES (solo si hay dominio)"
#   value       = length(aws_ses_domain_identity.domain) > 0 ? aws_ses_domain_identity.domain[0].arn : null
# }

# output "dkim_tokens" {
#   description = "Tokens DKIM para configurar en el DNS (solo si hay dominio)"
#   value       = length(aws_ses_domain_dkim.dkim) > 0 ? aws_ses_domain_dkim.dkim[0].dkim_tokens : []
# }

# output "template_name" {
#   description = "Nombre de la plantilla SES creada"
#   value       = length(aws_ses_template.template) > 0 ? aws_ses_template.template[0].name : null
# }


output "email_identities" {
  description = "Lista de identidades de correo verificadas"
  value       = [for email in aws_ses_email_identity.emails : email.email]
}

output "ses_domain_identity_arn" {
  description = "ARN del dominio SES (solo si hay dominio)"
  value       = length(aws_ses_domain_identity.domain) > 0 ? aws_ses_domain_identity.domain[0].arn : null
}

output "dkim_tokens" {
  description = "Tokens DKIM para configurar en el DNS (solo si hay dominio)"
  value       = length(aws_ses_domain_dkim.dkim) > 0 ? aws_ses_domain_dkim.dkim[0].dkim_tokens : []
}

output "template_names" {
  description = "List of SES email template names."
  value = [for template in aws_ses_template.template : template.name]
}


