# Azure Storage Account Module

This module provisions an Azure Storage Account configured with standard performance, enforced encryption, and strict access controls. It provides secure and reliable storage for your workloads.

## Features

- **Standard Performance Tier:** Deploys the Storage Account in the Standard tier.
- **Replication Options:** Allows configurable replication (e.g., LRS, GRS) to suit your needs.
- **Infrastructure Encryption Enabled:** Provides an extra layer of encryption for data at rest.
- **Secure Access:** Prevents nested items from being public and disables shared access keys.

# Required Variables

## product  
**Type:** string  
**Description:** Unique identifier for the product. This is used as part of the Storage Account name.

## environment  
**Type:** string  
**Description:** Specifies the deployment environment (e.g., dev, test, prod).

## location  
**Type:** string  
**Description:** The Azure region where the Storage Account will be deployed.

## rg_name  
**Type:** string  
**Description:** The name of the resource group that will contain the Storage Account.

## replication_type  
**Type:** string  
**Description:** Specifies the replication type for the Storage Account (e.g., `LRS`, `GRS`).

## local.all_tags  
**Type:** map(string)  
**Description:** A map of tags to apply to the Storage Account for resource management and billing purposes.

## Requirements

Terraform 0.12+ with the [AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest).

## Example Usage

```hcl
resource "azurerm_storage_account" "main_storage" {
  name                              = "stg${var.product}${var.environment}"
  resource_group_name               = var.rg_name
  location                          = var.location
  account_tier                      = "Standard"
  account_replication_type          = var.replication_type
  infrastructure_encryption_enabled = true
  allow_nested_items_to_be_public   = false
  shared_access_key_enabled         = false

  tags                              = local.all_tags
}
