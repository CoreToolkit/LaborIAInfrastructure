resource_group_name       = "rg-laboria-prod"
location                  = "eastus"
acr_name                  = "laboriaacr"
key_vault_name            = "kv-laboria-prod"
environment               = "prod"
backend_image_repository  = "backend"
frontend_image_repository = "frontend"

frontend_public_url = "https://ca-frontend-prod.eastus.azurecontainerapps.io"


container_app_env_name = "cae-laboria-prod"
backend_app_name       = "ca-backend-prod"
frontend_app_name      = "ca-frontend-prod"
