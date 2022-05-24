output "vault-id" {
  description = "Key Vault ID"
  value       = azurerm_key_vault.key-vault.id
}

output "vault-url" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.key-vault.vault_uri
}

output "vault-secrets" {
  value = values(azurerm_key_vault_secret.secret).*.value
}