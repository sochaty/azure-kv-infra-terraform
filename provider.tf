# define terraform provider
terraform {
    backend "azurerm" {
    resource_group_name  = "demo-rg"
    storage_account_name = "demosa25052022"
    container_name       = "tfstate-bc"
    key                  = "infra/kv/terraform.tfstate"
  }
  required_version = ">= 0.12"
}

# configure the azure provider
provider "azurerm" { 
#   environment     = "public"
  subscription_id = var.azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret
  tenant_id       = var.azure-tenant-id
  skip_provider_registration = true
  features {}
}