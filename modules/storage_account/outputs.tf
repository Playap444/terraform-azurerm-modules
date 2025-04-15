output "storage_account_id" {
  description = "Storage Account ID"
  value = azurerm_storage_account.main_storage.id
}
output "storage_account_name" {
  description = "Storage Account Name"
  value = azurerm_storage_account.main_storage.name
}
