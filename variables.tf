variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "capacity" {
  description = "Nombre del proyecto"
  type        = string
}

variable "env" {
  description = "Ambiente (dev, qa, sbx, stg, pdn)"
  type        = string
}

variable "country" {
  description = "País de despliegue (co, pa, gt, ts)"
  type        = string
}

variable "confidentiality" {
  description = "Clasificación de confidencialidad"
  type        = string
}

variable "integrity" {
  description = "Clasificación de integridad"
  type        = string
}

variable "availability" {
  description = "Clasificación de disponibilidad"
  type        = string
}

variable "information_domain" {
  description = "Dominio de información"
  type        = string
}

variable "personal_data" {
  description = "Datos personal"
  type        = bool
}

variable "pci" {
  description = "pci"
  type        = bool
}

variable "bucket_name" {
  description = "Nombre del bucket"
  type        = string
}

variable "force_destroy" {
  description = "Eliminación forzada"
  type        = bool
}

variable "versioning" {
  description = "Versionado"
  type        = string
}

variable "rule_name" {
  description = "Nombre de la regla"
  type        = string
}

variable "rule_description" {
  description = "Descripción de la regla"
  type        = string
  default     = "Regla que escucha eventos ObjectCreated de S3 y dispara una Lambda"
}

variable "rule_type" {
  description = "Tipo de regla"
  type        = string
}

variable "handler" {
  description = "Función manejadora"
  type        = string
}

variable "runtime" {
  description = "Entorno de ejecución"
  type        = string
}

variable "owner" {
  description = "Propietario del proyecto"
  type        = string
}