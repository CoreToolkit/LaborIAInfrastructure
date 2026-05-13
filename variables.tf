variable "resource_group_name" {
  description = "Nombre del Resource Group principal"
  type        = string
}

variable "location" {
  description = "Region de Azure"
  type        = string
  default     = "eastus"
}

variable "acr_name" {
  description = "Nombre del Azure Container Registry"
  type        = string
}

variable "key_vault_name" {
  description = "Nombre del Azure Key Vault"
  type        = string
}

variable "environment" {
  description = "Nombre del ambiente"
  type        = string
  default     = "prod"
}

variable "backend_image_repository" {
  description = "Repositorio de imagen backend en ACR"
  type        = string
  default     = "backend"
}

variable "frontend_image_repository" {
  description = "Repositorio de imagen frontend en ACR"
  type        = string
  default     = "frontend"
}

variable "backend_image_tag" {
  description = "Tag de imagen backend"
  type        = string
  default     = "latest"
}

variable "frontend_image_tag" {
  description = "Tag de imagen frontend"
  type        = string
  default     = "latest"
}

variable "container_app_env_name" {
  description = "Nombre del Container App Environment"
  type        = string
  default     = null
}

variable "backend_app_name" {
  description = "Nombre del Container App backend"
  type        = string
  default     = null
}

variable "frontend_app_name" {
  description = "Nombre del Container App frontend"
  type        = string
  default     = null
}

variable "backend_cpu" {
  description = "CPU del backend"
  type        = number
  default     = 0.75
}

variable "backend_memory" {
  description = "Memoria del backend"
  type        = string
  default     = "1.5Gi"
}

variable "frontend_cpu" {
  description = "CPU del frontend"
  type        = number
  default     = 0.5
}

variable "frontend_memory" {
  description = "Memoria del frontend"
  type        = string
  default     = "1Gi"
}

variable "backend_min_replicas" {
  type    = number
  default = 1
}

variable "backend_max_replicas" {
  type    = number
  default = 4
}

variable "frontend_min_replicas" {
  type    = number
  default = 1
}

variable "frontend_max_replicas" {
  type    = number
  default = 3
}

variable "cors_local_host_front" {
  description = "Origen local permitido por CORS"
  type        = string
  default     = "http://localhost:3000"
}

variable "cors_local_ip" {
  description = "IP local permitida por CORS"
  type        = string
  default     = "http://127.0.0.1"
}

variable "frontend_public_url" {
  description = "URL publica del frontend para CORS en backend"
  type        = string
}

variable "secret_names" {
  description = "Nombres de secretos en Key Vault"
  type = object({
    database_url            = string
    jwt_secret              = string
    session_secret_key      = string
    google_client_id        = string
    google_client_secret    = string
    google_redirect_uri     = string
    microsoft_client_id     = string
    microsoft_client_secret = string
    microsoft_tenant_id     = string
    microsoft_redirect_uri  = string
    azure_openai_endpoint   = string
    azure_openai_api_key    = string
    azure_openai_deployment = string
    azure_openai_api_ver    = string
    speech_key              = string
    speech_region           = string
    elevenlabs_api_key      = string
    elevenlabs_voice_id     = string
  })

  default = {
    database_url            = "backend-database-url"
    jwt_secret              = "backend-jwt-secret"
    session_secret_key      = "backend-session-secret-key"
    google_client_id        = "backend-google-client-id"
    google_client_secret    = "backend-google-client-secret"
    google_redirect_uri     = "backend-google-redirect-uri"
    microsoft_client_id     = "backend-microsoft-client-id"
    microsoft_client_secret = "backend-microsoft-client-secret"
    microsoft_tenant_id     = "backend-microsoft-tenant-id"
    microsoft_redirect_uri  = "backend-microsoft-redirect-uri"
    azure_openai_endpoint   = "backend-azure-openai-endpoint"
    azure_openai_api_key    = "backend-azure-openai-api-key"
    azure_openai_deployment = "backend-azure-openai-deployment"
    azure_openai_api_ver    = "backend-azure-openai-api-version"
    speech_key              = "backend-speech-key"
    speech_region           = "backend-speech-region"
    elevenlabs_api_key      = "backend-elevenlabs-api-key"
    elevenlabs_voice_id     = "backend-elevenlabs-voice-id"
  }
}
