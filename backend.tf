terraform {
  backend "azurerm" {
    # Valores reales del baseline Azure de laboria
    resource_group_name  = "rg-laboria-prod"
    storage_account_name = "laboriaterraformstate"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
