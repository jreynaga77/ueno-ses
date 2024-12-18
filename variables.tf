# Ambiente (dev, prod, etc.)
variable "environment" {
  description = "El entorno de despliegue (dev o prod)"
  type        = string
}

# Lista de correos electrónicos para verificar
variable "email_addresses" {
  description = "Lista de correos electrónicos a verificar en SES"
  type        = list(string)
  default     = []
}

# Dominio SES (solo para prod)
variable "enable_domain" {
  description = "Flag para habilitar o deshabilitar la verificación de dominio"
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Nombre del dominio SES a verificar (solo para prod)"
  type        = string
  default     = null
}

# Plantillas (solo para prod)
variable "enable_templates" {
  description = "Flag para habilitar o deshabilitar plantillas SES"
  type        = bool
  default     = false
}

variable "template_name" {
  description = "Nombre de la plantilla SES"
  type        = string
  default     = null
}

variable "template_html" {
  description = "Contenido HTML de la plantilla SES"
  type        = string
  default     = null
}

variable "template_text" {
  description = "Contenido de texto plano de la plantilla SES"
  type        = string
  default     = null
}

variable "template_subject" {
  description = "Asunto de la plantilla SES"
  type        = string
  default     = null
}
