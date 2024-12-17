variable "domain_name" {
  type        = string
  description = "Domain name to configure in SES"
}

variable "enable_domain" {
  type        = bool
  default     = true
  description = "Enable SES domain configuration"
}

variable "enable_templates" {
  type        = bool
  default     = false
  description = "Enable email templates in SES"
}

variable "template_name" {
  type        = string
  description = "Name of the email template"
  default     = null
}

variable "template_html" {
  type        = string
  description = "HTML part of the template"
  default     = null
}

variable "template_text" {
  type        = string
  description = "Text part of the template"
  default     = null
}

variable "template_subject" {
  type        = string
  description = "Subject of the email template"
  default     = null
}

variable "domains" {
  type        = list(string)
  description = "List of domains to configure in SES"
  default     = []
}

variable "emails" {
  type        = list(string)
  description = "List of email addresses to configure in SES"
  default     = []
}

variable "templates" {
  type = map(object({
    html_part    = string
    text_part    = string
    subject_part = string
  }))
  description = "Map of email templates for SES configuration"
  default     = {}
}

variable "sns_topic_name" {
  description = "Nombre personalizado para el SNS Topic (opcional)"
  type        = string
  default     = null
}

variable "sns_subscriptions" {
  description = "Lista de correos electrónicos a suscribir al SNS Topic"
  type        = list(string)
  default     = []
}