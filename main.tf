locals {
  container_app_env_name = coalesce(var.container_app_env_name, "cae-laboria-${var.environment}")
  backend_app_name       = coalesce(var.backend_app_name, "ca-backend-${var.environment}")
  frontend_app_name      = coalesce(var.frontend_app_name, "ca-frontend-${var.environment}")
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_container_registry" "main" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "main" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "database_url" {
  name         = var.secret_names.database_url
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "jwt_secret" {
  name         = var.secret_names.jwt_secret
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "session_secret_key" {
  name         = var.secret_names.session_secret_key
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "google_client_id" {
  name         = var.secret_names.google_client_id
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "google_client_secret" {
  name         = var.secret_names.google_client_secret
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "google_redirect_uri" {
  name         = var.secret_names.google_redirect_uri
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "microsoft_client_id" {
  name         = var.secret_names.microsoft_client_id
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "microsoft_client_secret" {
  name         = var.secret_names.microsoft_client_secret
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "microsoft_tenant_id" {
  name         = var.secret_names.microsoft_tenant_id
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "microsoft_redirect_uri" {
  name         = var.secret_names.microsoft_redirect_uri
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "azure_openai_endpoint" {
  name         = var.secret_names.azure_openai_endpoint
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "azure_openai_api_key" {
  name         = var.secret_names.azure_openai_api_key
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "azure_openai_deployment" {
  name         = var.secret_names.azure_openai_deployment
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "azure_openai_api_ver" {
  name         = var.secret_names.azure_openai_api_ver
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "speech_key" {
  name         = var.secret_names.speech_key
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "speech_region" {
  name         = var.secret_names.speech_region
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "elevenlabs_api_key" {
  name         = var.secret_names.elevenlabs_api_key
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "elevenlabs_voice_id" {
  name         = var.secret_names.elevenlabs_voice_id
  key_vault_id = data.azurerm_key_vault.main.id
}

resource "azurerm_container_app_environment" "main" {
  name                = local.container_app_env_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_container_app" "backend" {
  name                         = local.backend_app_name
  resource_group_name          = data.azurerm_resource_group.main.name
  container_app_environment_id = azurerm_container_app_environment.main.id
  revision_mode                = "Single"

  secret {
    name  = "acr-password"
    value = data.azurerm_container_registry.main.admin_password
  }

  secret {
    name  = "database-url"
    value = data.azurerm_key_vault_secret.database_url.value
  }

  secret {
    name  = "jwt-secret"
    value = data.azurerm_key_vault_secret.jwt_secret.value
  }

  secret {
    name  = "session-secret-key"
    value = data.azurerm_key_vault_secret.session_secret_key.value
  }

  secret {
    name  = "google-client-id"
    value = data.azurerm_key_vault_secret.google_client_id.value
  }

  secret {
    name  = "google-client-secret"
    value = data.azurerm_key_vault_secret.google_client_secret.value
  }

  secret {
    name  = "google-redirect-uri"
    value = data.azurerm_key_vault_secret.google_redirect_uri.value
  }

  secret {
    name  = "microsoft-client-id"
    value = data.azurerm_key_vault_secret.microsoft_client_id.value
  }

  secret {
    name  = "microsoft-client-secret"
    value = data.azurerm_key_vault_secret.microsoft_client_secret.value
  }

  secret {
    name  = "microsoft-tenant-id"
    value = data.azurerm_key_vault_secret.microsoft_tenant_id.value
  }

  secret {
    name  = "microsoft-redirect-uri"
    value = data.azurerm_key_vault_secret.microsoft_redirect_uri.value
  }

  secret {
    name  = "azure-openai-endpoint"
    value = data.azurerm_key_vault_secret.azure_openai_endpoint.value
  }

  secret {
    name  = "azure-openai-api-key"
    value = data.azurerm_key_vault_secret.azure_openai_api_key.value
  }

  secret {
    name  = "azure-openai-deployment"
    value = data.azurerm_key_vault_secret.azure_openai_deployment.value
  }

  secret {
    name  = "azure-openai-api-ver"
    value = data.azurerm_key_vault_secret.azure_openai_api_ver.value
  }

  secret {
    name  = "speech-key"
    value = data.azurerm_key_vault_secret.speech_key.value
  }

  secret {
    name  = "speech-region"
    value = data.azurerm_key_vault_secret.speech_region.value
  }

  secret {
    name  = "elevenlabs-api-key"
    value = data.azurerm_key_vault_secret.elevenlabs_api_key.value
  }

  secret {
    name  = "elevenlabs-voice-id"
    value = data.azurerm_key_vault_secret.elevenlabs_voice_id.value
  }

  registry {
    server               = data.azurerm_container_registry.main.login_server
    username             = data.azurerm_container_registry.main.admin_username
    password_secret_name = "acr-password"
  }

  template {
    min_replicas = var.backend_min_replicas
    max_replicas = var.backend_max_replicas

    container {
      name   = "backend"
      image  = "${data.azurerm_container_registry.main.login_server}/${var.backend_image_repository}:${var.backend_image_tag}"
      cpu    = var.backend_cpu
      memory = var.backend_memory

      env {
        name        = "DATABASE_URL"
        secret_name = "database-url"
      }

      env {
        name        = "JWT_SECRET"
        secret_name = "jwt-secret"
      }

      env {
        name        = "secret_key"
        secret_name = "session-secret-key"
      }

      env {
        name        = "GOOGLE_CLIENT_ID"
        secret_name = "google-client-id"
      }

      env {
        name        = "GOOGLE_CLIENT_SECRET"
        secret_name = "google-client-secret"
      }

      env {
        name        = "GOOGLE_REDIRECT_URI"
        secret_name = "google-redirect-uri"
      }

      env {
        name        = "MICROSOFT_CLIENT_ID"
        secret_name = "microsoft-client-id"
      }

      env {
        name        = "MICROSOFT_CLIENT_SECRET"
        secret_name = "microsoft-client-secret"
      }

      env {
        name        = "MICROSOFT_TENANT_ID"
        secret_name = "microsoft-tenant-id"
      }

      env {
        name        = "MICROSOFT_REDIRECT_URI"
        secret_name = "microsoft-redirect-uri"
      }

      env {
        name        = "AZURE_OPENAI_ENDPOINT"
        secret_name = "azure-openai-endpoint"
      }

      env {
        name        = "AZURE_OPENAI_API_KEY"
        secret_name = "azure-openai-api-key"
      }

      env {
        name        = "AZURE_OPENAI_DEPLOYMENT"
        secret_name = "azure-openai-deployment"
      }

      env {
        name        = "AZURE_OPENAI_API_VERSION"
        secret_name = "azure-openai-api-ver"
      }

      env {
        name        = "SPEECH_KEY"
        secret_name = "speech-key"
      }

      env {
        name        = "SPEECH_REGION"
        secret_name = "speech-region"
      }

      env {
        name        = "ELEVENLABS_API_KEY"
        secret_name = "elevenlabs-api-key"
      }

      env {
        name        = "ELEVENLABS_VOICE_ID"
        secret_name = "elevenlabs-voice-id"
      }

      env {
        name  = "LOCAL_HOST_FRONT"
        value = var.cors_local_host_front
      }

      env {
        name  = "LOCAL_IP"
        value = var.cors_local_ip
      }

      env {
        name  = "FRONTEND_URL"
        value = var.frontend_public_url
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8000
    transport        = "auto"

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}

resource "azurerm_container_app" "frontend" {
  name                         = local.frontend_app_name
  resource_group_name          = data.azurerm_resource_group.main.name
  container_app_environment_id = azurerm_container_app_environment.main.id
  revision_mode                = "Single"

  secret {
    name  = "acr-password"
    value = data.azurerm_container_registry.main.admin_password
  }

  registry {
    server               = data.azurerm_container_registry.main.login_server
    username             = data.azurerm_container_registry.main.admin_username
    password_secret_name = "acr-password"
  }

  template {
    min_replicas = var.frontend_min_replicas
    max_replicas = var.frontend_max_replicas

    container {
      name   = "frontend"
      image  = "${data.azurerm_container_registry.main.login_server}/${var.frontend_image_repository}:${var.frontend_image_tag}"
      cpu    = var.frontend_cpu
      memory = var.frontend_memory

      env {
        name  = "NEXT_PUBLIC_BACKEND_URL"
        value = "https://${var.backend_public_fqdn}"
      }

      env {
        name  = "NEXT_PUBLIC_BACKEND_WS_BASE"
        value = "wss://${var.backend_public_fqdn}/api/ws"
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 3000
    transport        = "auto"

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}
