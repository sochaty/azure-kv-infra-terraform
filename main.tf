# resource group #

# Create a resource group for better management
data "azurerm_resource_group" "security-rg" {
  name     = "security-${var.environment}-rg"
  # location = var.location
}

# key vault #

module "keyvault" {
  source              = "./modules/keyvault"
  name                = "${var.environment}-keyvault-26052022"
  location            = data.azurerm_resource_group.security-rg.location
  resource_group_name = data.azurerm_resource_group.security-rg.name
  
  enabled_for_deployment          = var.kv-vm-deployment
  enabled_for_disk_encryption     = var.kv-disk-encryption
  enabled_for_template_deployment = var.kv-template-deployment
  
  tags = {
    environment = "${var.environment}"
  }

  policies = {
    full = {
      tenant_id               = var.azure-tenant-id
      object_id               = var.kv-full-object-id
      key_permissions         = var.full-key-permissions
      secret_permissions      = var.full-secret-permissions
      certificate_permissions = var.full-certificate-permissions
      storage_permissions     = var.full-storage-permissions
    }
    read = {
      tenant_id               = var.azure-tenant-id
      object_id               = var.kv-read-object-id
      key_permissions         = var.readonly-key-permissions
      secret_permissions      = var.readonly-secret-permissions
      certificate_permissions = var.readonly-certificate-permissions
      storage_permissions     = var.readonly-storage-permissions
    }
  }

  secrets = var.kv-secrets
}