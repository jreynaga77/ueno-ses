# # Verificación de identidades de correo 
# resource "aws_ses_email_identity" "emails" {
#   for_each = toset(var.email_addresses)
#   email    = each.value
# }

# # Verificación del dominio SES 
# resource "aws_ses_domain_identity" "domain" {
#   count  = var.enable_domain ? 1 : 0
#   domain = var.domain_name
# }

# # Configuración de DKIM 
# resource "aws_ses_domain_dkim" "dkim" {
#   count  = var.enable_domain ? 1 : 0
#   domain = aws_ses_domain_identity.domain[0].domain
# }

# # Configuración de plantillas SES 
# resource "aws_ses_template" "template" {
#   count   = var.enable_templates ? 1 : 0
#   name    = var.template_name
#   html    = var.template_html
#   text    = var.template_text
#   subject = var.template_subject
# }


locals {
  stage_config = {
    dev = {
      enable_domain    = false
      enable_templates = true
    }
    prod = {
      enable_domain    = true
      enable_templates = true
    }
    stg = {
      enable_domain    = false
      enable_templates = true
    }
  }

  final_enable_domain    = lookup(local.stage_config[var.stage], "enable_domain", false)
  final_enable_templates = lookup(local.stage_config[var.stage], "enable_templates", true)
}


resource "aws_ses_email_identity" "emails" {
  count = local.final_enable_domain ? 0 : length(var.email_addresses)
  email = var.email_addresses[count.index]
}


resource "aws_ses_domain_identity" "domain" {
  count  = local.final_enable_domain ? 1 : 0
  domain = var.domain_name
}


resource "aws_ses_domain_dkim" "dkim" {
  count  = local.final_enable_domain ? 1 : 0
  domain = aws_ses_domain_identity.domain[0].domain
}


# resource "aws_ses_template" "template" {
#   count   = local.final_enable_templates ? 1 : 0
#   name    = var.template_name
#   html    = var.template_html
#   text    = var.template_text
#   subject = var.template_subject
# }

resource "aws_ses_template" "template" {
  for_each = { for idx, template in var.template_name : template.name => template }

  name    = each.value.name
  html    = each.value.html
  text    = each.value.text
  subject = each.value.subject
}
