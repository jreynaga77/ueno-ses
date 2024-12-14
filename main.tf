resource "aws_ses_domain_identity" "domain" {
  count = var.enable_domain ? 1 : 0
  domain = var.domain_name
}

resource "aws_ses_template" "template" {
  count          = var.enable_templates ? 1 : 0
  name           = var.template_name
  html           = var.template_html
  text           = var.template_text
  subject        = var.template_subject
}
