output "keyvault_url" {
  description = "KeyVault URL"
  value = azurerm_key_vault.main_keyvault.vault_uri
}