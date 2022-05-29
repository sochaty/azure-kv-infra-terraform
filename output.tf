output "key-vault-id" {
  description = "Key Vault ID"
  value       = module.keyvault.vault-id
}

output "key-vault-url" {
  description = "Key Vault URI"
  value       = module.keyvault.vault-url
}

output "key-vault-secrets" {
  value = module.keyvault.vault-secrets
  sensitive = true
}