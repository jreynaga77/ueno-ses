# AWS SES Terraform Module

## Overview

### Description

This Terraform module is designed to configure the Amazon Simple Email Service (SES) on AWS. It allows for domain verification, email address configuration, and the creation of email templates. With this module, you can easily integrate email sending from your domain and manage templates for transactional emails.

### Prerequisites & Dependencies

Before using this module, ensure the following are configured:

- An AWS account with permissions to manage SES.
- The domain must be verified in SES.
- If using templates, the necessary data to define them should be available.

### Usage

To use this module, include the following block of code in your Terraform configuration file:

```hcl
module "ses" {
  source = "github.com/jreynaga77/ueno-ses" 
  
  domain_name        = "example2.com"        
  enable_domain      = true                 
  enable_templates   = true                
  template_name      = "example-template"   
  template_html      = "<html><body><h1>Hello</h1></body></html>"  
  template_text      = "Hello"              
  template_subject   = "Test Email Subject" 
}

output "ses_domain_identity_arn" {
  value = module.ses.ses_domain_identity_arn
}

output "dkim_tokens" {
  value = module.ses.dkim_tokens
}

output "template_name" {
  value = module.ses.template_name
}

output "templates" {
  value = module.ses.templates
}
```

## Package content

This section explains the structure and elements that represent the artifacts of the product.

| Folder   | Name          | Description |
|----------|---------------|-------------|
| examples | .tf            | Terraform files examples to deploy Amazon SES resources |
| Root     | README.md      | Product documentation file |
| Root     | main.tf        | Terraform file to define SES resources to be deployed (such as email identities, configuration sets, and policies) |
| Root     | variables.tf   | Terraform file to configure the SES deployment variables |
| Root     | outputs.tf     | Terraform file to check SES-related outputs after deployment |

---

## **Configuration variables list**

### **Required variables for SES deployment**

| Name                  | Type     | Required | Description |
|-----------------------|----------|----------|-------------|
| domain_name           | `string` | yes      | The domain name to configure in SES. |
| enable_domain         | `bool`   | yes      | A boolean that indicates whether SES domain configuration should be enabled. Default is `true`. |
| enable_templates      | `bool`   | yes      | A boolean that indicates whether email templates should be enabled in SES. Default is `false`. |
| template_name         | `string` | no       | The name of the email template. |
| template_html         | `string` | no       | The HTML part of the email template. |
| template_text         | `string` | no       | The text part of the email template. |
| template_subject      | `string` | no       | The subject of the email template. |
| domains               | `list(string)` | no  | A list of domain names to configure in SES. Default is an empty list. |
| emails                | `list(string)` | no  | A list of email addresses to configure in SES. Default is an empty list. |
| templates             | `map(object({ html_part = string, text_part = string, subject_part = string }))` | no | A map of email templates for SES configuration, where each key is the template name and the value contains the HTML part, text part, and subject part. |

---

## **Outputs**

### **Outputs relacionados con dominio**

| Name                      | Type    | Description |
|---------------------------|---------|-------------|
| ses_domain_identity_arn   | `string` | The ARN (Amazon Resource Name) of the SES domain identity. |
| dkim_tokens               | `list(string)` | A list of DKIM tokens associated with the SES domain identity. |

### **Outputs relacionados con direcciones de correo**

| Name                      | Type    | Description |
|---------------------------|---------|-------------|
| email_identities          | `list(string)` | A list of verified email identities (addresses) in SES. |

### **Outputs relacionados con plantillas**

| Name                      | Type    | Description |
|---------------------------|---------|-------------|
| template_name             | `string` | The name of the SES email template. |
| templates                 | `list(string)` | A list of SES email template names. |





