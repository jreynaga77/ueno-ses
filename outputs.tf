output "ses_domain_identity_arn" {
  value = length(aws_ses_domain_identity.domain) > 0 ? aws_ses_domain_identity.domain[0].arn : null
}

output "dkim_tokens" {
  value = length(aws_ses_domain_dkim.dkim) > 0 ? aws_ses_domain_dkim.dkim[0].dkim_tokens : []
}

output "email_identities" {
  value = length(aws_ses_email_identity.emails) > 0 ? [for email in aws_ses_email_identity.emails : email.email] : []
}

output "template_name" {
  value = length(aws_ses_template.template) > 0 ? aws_ses_template.template[0].name : null
}

output "templates" {
  value = length(aws_ses_template.templates) > 0 ? [for t in aws_ses_template.templates : t.name] : []
}


