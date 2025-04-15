resource "azurerm_storage_account" "main_storage" {
  name                              = "stg${var.product}${var.environment}"
  resource_group_name               = var.rg_name
  location                          = var.location
  account_tier                      = "Standard"
  account_replication_type          = var.replication_type
  infrastructure_encryption_enabled = true
  allow_nested_items_to_be_public   = false
  shared_access_key_enabled         = false

  tags = local.all_tags

}