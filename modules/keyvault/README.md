# Azure Key Vault Module

This module provisions an Azure Key Vault with security and compliance best practices. It is configured for disk encryption, soft delete with purge protection, RBAC authorization, and secure (private) access.

## Features

- **Disk Encryption Enabled:** Ensures encryption of disks that use the vault.
- **Soft Delete & Purge Protection:** Retains deleted vaults for 90 days and prevents accidental purging.
- **RBAC Authorization:** Uses role-based access control for managing permissions.
- **Secure Access:** Disables public network access.



# Required Variables
## product
Type: string
Description: Unique identifier for the product. This is used as part of the Key Vault name.

## environment
Type: string
Description: Specifies the deployment environment (e.g., dev, test, prod).

## location
Type: string
Description: The Azure region where the Key Vault will be deployed.

## rg_name
Type: string
Description: The name of the resource group that will contain the Key Vault.

## tenant_id
Type: string
Description: The Azure Active Directory tenant ID used for authorization.

## kv_sku_name
Type: string
Description: The SKU for the Key Vault (e.g., standard or premium).

## local.all_tags
Type: map(string)
Description: A map of tags to apply to the Key Vault for resource management and billing purposes.

Requirements
Terraform 0.12+ with the AzureRM Provider.

## Example Usage

```hcl
resource "azurerm_key_vault" "main_keyvault" {
  name                          = "kv-${var.product}-${var.environment}-${var.location}"
  location                      = var.location
  resource_group_name           = var.rg_name
  enabled_for_disk_encryption   = true
  tenant_id                     = var.tenant_id
  soft_delete_retention_days    = 90
  purge_protection_enabled      = true
  public_network_access_enabled = false

  enable_rbac_authorization     = true
  sku_name                      = var.kv_sku_name

  tags                          = local.all_tags
}
hcl```
