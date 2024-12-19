# Verificación de identidades de correo (común para todos los entornos)
resource "aws_ses_email_identity" "emails" {
  for_each = toset(var.email_addresses)
  email    = each.value
}

# Verificación del dominio SES (solo si está habilitado)
resource "aws_ses_domain_identity" "domain" {
  count  = var.enable_domain ? 1 : 0
  domain = var.domain_name
}

# Configuración de DKIM (solo si hay dominio)
resource "aws_ses_domain_dkim" "dkim" {
  count  = var.enable_domain ? 1 : 0
  domain = aws_ses_domain_identity.domain[0].domain
}

# Configuración de plantillas SES (solo si está habilitado)
resource "aws_ses_template" "template" {
  count   = var.enable_templates ? 1 : 0
  name    = var.template_name
  html    = var.template_html
  text    = var.template_text
  subject = var.template_subject
}
