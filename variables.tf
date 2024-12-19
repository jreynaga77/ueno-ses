variable "environment" {
  description = "El entorno de despliegue (dev o prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "El entorno debe ser 'dev' o 'prod'."
  }
}

variable "enable_domain" {
  description = "Flag para habilitar o deshabilitar dominios SES (automático en prod)."
  type        = bool
  default     = var.environment == "prod"
}

variable "domain_name" {
  description = "Nombre del dominio SES a verificar (obligatorio en prod)."
  type        = string
  default     = null
  validation {
    condition     = var.environment != "prod" || var.domain_name != null
    error_message = "Debes especificar 'domain_name' cuando el entorno es 'prod'."
  }
}

variable "email_addresses" {
  description = "Lista de correos electrónicos a verificar en SES. Opcional en prod, obligatorio en dev."
  type        = list(string)
  default     = []
}

variable "enable_templates" {
  description = "Flag para habilitar plantillas SES. Siempre activado por defecto."
  type        = bool
  default     = true
}

variable "template_name" {
  description = "Nombre de la plantilla SES."
  type        = string
  default     = var.environment == "dev" ? "dev_template" : "prod_template"
}

variable "template_html" {
  description = "Contenido HTML de la plantilla SES."
  type        = string
  default     = var.environment == "dev" ? "<html><body><h1>Dev Template</h1></body></html>" : "<html><body><h1>Prod Template</h1></body></html>"
}

variable "template_text" {
  description = "Contenido de texto plano de la plantilla SES."
  type        = string
  default     = var.environment == "dev" ? "Dev Template Text" : "Prod Template Text"
}

variable "template_subject" {
  description = "Asunto de la plantilla SES."
  type        = string
  default     = var.environment == "dev" ? "Welcome to Dev" : "Welcome to Prod"
}
