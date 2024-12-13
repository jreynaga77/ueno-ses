resource "aws_ses_domain_identity" "domain" {
  count = var.enable_domain ? 1 : 0
  domain = var.domain_name
}

resource "aws_ses_email_template" "template" {
  count          = var.enable_templates ? 1 : 0
  template_name  = var.template_name
  html_part      = var.template_html
  text_part      = var.template_text
  subject_part   = var.template_subject
}
