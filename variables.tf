# # Ambiente (dev, prod, etc.)
# variable "environment" {
#   description = "El entorno de despliegue (dev o prod)"
#   type        = string
#   default     = "dev"
# }

# # Lista de correos electrónicos para verificar
# variable "email_addresses" {
#   description = "Lista de correos electrónicos a verificar en SES"
#   type        = list(string)
#   default     = []
# }

# # Dominio SES
# variable "enable_domain" {
#   description = "Flag para habilitar o deshabilitar la verificación de dominio"
#   type        = bool
#   default     = false
# }

# variable "domain_name" {
#   description = "Nombre del dominio SES a verificar"
#   type        = string
#   default     = null
# }

# # Plantillas
# variable "enable_templates" {
#   description = "Flag para habilitar o deshabilitar plantillas SES (activadas por defecto)"
#   type        = bool
#   default     = true
# }

# variable "template_name" {
#   description = "Nombre de la plantilla SES"
#   type        = string
#   default     = "default_template"
# }

# variable "template_html" {
#   description = "Contenido HTML de la plantilla SES"
#   type        = string
#   default     = "<html><body><h1>Default Template</h1></body></html>"
# }

# variable "template_text" {
#   description = "Contenido de texto plano de la plantilla SES"
#   type        = string
#   default     = "Default Template Text"
# }

# variable "template_subject" {
#   description = "Asunto de la plantilla SES"
#   type        = string
#   default     = "Default Subject"
# }



variable "stage" {
  description = "Stage del entorno (dev, stg, prod)"
  type        = string
}


variable "email_addresses" {
  description = "Lista de correos electrónicos a verificar en SES"
  type        = list(string)
  default     = []
}


variable "domain_name" {
  description = "Nombre del dominio SES a verificar"
  type        = string
  default     = null
}


variable "template_name" {
  description = "Nombre de la plantilla SES"
  type        = string
  default     = "default_template"
}

variable "template_html" {
  description = "Contenido HTML de la plantilla SES"
  type        = string
  default     = "<html><body><h1>Default Template</h1></body></html>"
}

variable "template_text" {
  description = "Contenido de texto plano de la plantilla SES"
  type        = string
  default     = "Default Template Text"
}

variable "template_subject" {
  description = "Asunto de la plantilla SES"
  type        = string
  default     = "Default Subject"
}

variable "templates" {
  description = "List of SES email templates"
  type = list(object({
    name    = string
    html    = string
    text    = string
    subject = string
  }))
  default = []
}
