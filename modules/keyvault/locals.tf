locals {
  all_tags = {
    is_terraform = var.is_terraform
    product      = var.product
    environment  = var.environment
  }
}