# # Verificación de identidades de correo (común para todos los entornos)
# resource "aws_ses_email_identity" "emails" {
#   for_each = toset(var.email_addresses)
#   email    = each.value
# }

# # Verificación del dominio SES (solo si está habilitado)
# resource "aws_ses_domain_identity" "domain" {
#   count  = var.enable_domain ? 1 : 0
#   domain = var.domain_name
# }

# # Configuración de DKIM (solo si hay dominio)
# resource "aws_ses_domain_dkim" "dkim" {
#   count  = var.enable_domain ? 1 : 0
#   domain = aws_ses_domain_identity.domain[0].domain
# }

# # Configuración de plantillas SES (solo si está habilitado)
# resource "aws_ses_template" "template" {
#   count   = var.enable_templates ? 1 : 0
#   name    = var.template_name
#   html    = var.template_html
#   text    = var.template_text
#   subject = var.template_subject
# }

# Configuración local según el stage
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
  }
}

# Valores calculados en función del stage
variable "final_enable_domain" {
  default = lookup(local.stage_config[var.stage], "enable_domain", false)
}

variable "final_enable_templates" {
  default = lookup(local.stage_config[var.stage], "enable_templates", true)
}

# Recurso: Identidades de correo electrónico
resource "aws_ses_email_identity" "emails" {
  count = var.final_enable_domain ? 0 : length(var.email_addresses)
  email = var.email_addresses[count.index]
}

# Recurso: Verificación de dominio SES
resource "aws_ses_domain_identity" "domain" {
  count  = var.final_enable_domain ? 1 : 0
  domain = var.domain_name
}

# Recurso: Configuración de DKIM
resource "aws_ses_domain_dkim" "dkim" {
  count  = var.final_enable_domain ? 1 : 0
  domain = aws_ses_domain_identity.domain[0].domain
}

# Recurso: Plantillas SES
resource "aws_ses_template" "template" {
  count   = var.final_enable_templates ? 1 : 0
  name    = var.template_name
  html    = var.template_html
  text    = var.template_text
  subject = var.template_subject
}
