variable "enable_domain" {
  type    = bool
  default = true
}

variable "domain_name" {
  type        = string
  description = "Domain name to configure in SES"
}

variable "enable_templates" {
  type    = bool
  default = false
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
