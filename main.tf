/*----------------------------------------------------------------------*/
/* S3 bucket | Main resource                                            */
/*----------------------------------------------------------------------*/

resource "aws_ses_domain_identity" "domain" {
  count  = var.enable_domain ? 1 : 0
  domain = var.domain_name
}

resource "aws_ses_domain_dkim" "dkim" {
  count  = var.enable_domain ? 1 : 0
  domain = aws_ses_domain_identity.domain[0].domain
}

resource "aws_ses_email_identity" "emails" {
  for_each = toset(var.domains)
  email    = each.value
}

resource "aws_ses_template" "template" {
  count          = var.enable_templates ? 1 : 0
  name           = var.template_name
  html           = var.template_html
  text           = var.template_text
  subject        = var.template_subject
}

resource "aws_ses_template" "templates" {
  for_each = var.templates
  name     = each.key
  html     = each.value.html_part
  text     = each.value.text_part
  subject  = each.value.subject_part
}
