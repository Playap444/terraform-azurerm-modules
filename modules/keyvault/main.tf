resource "azurerm_key_vault" "main_keyvault" {
  name                          = "kv-${var.product}-${var.environment}-${var.location}"
  location                      = var.location
  resource_group_name           = var.rg_name
  enabled_for_disk_encryption   = true
  tenant_id                     = var.tenant_id
  soft_delete_retention_days    = 90
  purge_protection_enabled      = true
  public_network_access_enabled = false

  enable_rbac_authorization = true

  sku_name = var.kv_sku_name

  tags = local.all_tags
}